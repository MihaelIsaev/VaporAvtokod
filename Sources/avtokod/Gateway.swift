//
//  Gateway.swift
//  Avtokod
//
//  Created by Mihael Isaev on 13/12/2018.
//

import Foundation
import Vapor

public class Gateway {
    var prefix: String { return "" }
    weak var root: Avtokod?
    let container: Container
    
    init (on container: Container, root: Avtokod) {
        self.container = container
        self.root = root
    }
    
    typealias BeforeSend = (Request) throws -> Void
    
    func request(to endpoint: String, method: HTTPMethod, skipAuth: Bool? = nil, beforeSend: @escaping BeforeSend = { _ in }) throws -> Future<Response> {
        guard let root = root else { throw Abort(.internalServerError) }
        let url = root.baseURL + prefix + (endpoint.count > 0 ? "/" + endpoint : "")
        if skipAuth == true {
            return try executeRequest(url, method: method, headers: headers, beforeSend: beforeSend)
        }
        return try authorize().flatMap { headers in
            print("AVTOKOD headers: \(headers)")
            return try self.executeRequest(url, method: method, headers: headers, beforeSend: beforeSend).map { response in
                if response.http.status == .ok {
                    return response
                }
                throw Abort(.expectationFailed, reason: "Got \(response.http.status)")
            }
        }
    }
    
    func executeRequest(_ url: String, method: HTTPMethod, headers: HTTPHeaders, beforeSend: BeforeSend) throws -> Future<Response> {
        print("AVTOKOD: sending request to \(url)")
        let client = try container.make(Client.self)
        switch method {
        case .GET: return client.get(url, headers: headers, beforeSend: beforeSend)
        case .POST: return client.post(url, headers: headers, beforeSend: beforeSend)
        case .PUT: return client.put(url, headers: headers, beforeSend: beforeSend)
        case .PATCH: return client.patch(url, headers: headers, beforeSend: beforeSend)
        case .DELETE: return client.delete(url, headers: headers, beforeSend: beforeSend)
        default: throw Abort(.internalServerError, reason: "Unsupportable HTTP method")
        }
    }
    
    private func authorize() throws -> Future<HTTPHeaders> {
        guard let root = root else { throw Abort(.internalServerError) }
        var headers = self.headers
        var token: String
        if let t = root.token, t.till > Date() {
            token = t.value
        } else {
            token = try Token.generate(user: root.user, pass: root.password)
        }
        headers.add(name: .authorization, value: token)
        return container.eventLoop.newSucceededFuture(result: headers)
    }
    
    var headers: HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: HTTPHeaderName.accept, value: "application/json")
        return headers
    }
}
