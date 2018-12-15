//
//  DevGateway.swift
//  Avtokod
//
//  Created by Mihael Isaev on 13/12/2018.
//

import Foundation
import Vapor

public class DevGateway: Gateway {
    override var prefix: String { return "dev" }
    
    // /dev/ping
    public func ping() -> Future<Void> {
        return container.eventLoop.newSucceededFuture(result: ())
    }
    
    struct TokenResponse: Content {
        var rawToken, token, header: String
        private enum CodingKeys : String, CodingKey {
            case rawToken = "raw_token", token, header
        }
    }
    
    func token(user: String, password: String) throws -> Future<TokenResponse> {
        let df = DateFormatter()
        df.timeZone = TimeZone(secondsFromGMT: 0)
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = df.string(from: Date())
        let endpoint = "token?user=\(user)&pass=\(password)&ishash=false&date=\(date)&age=\(Int64(Token.age))"
        return try request(to: endpoint, method: .GET, skipAuth: true).flatMap { response in
            return try response.content.decode(TokenResponse.self)
        }
    }
}
