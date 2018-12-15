//
//  UserGateway.swift
//  Avtokod
//
//  Created by Mihael Isaev on 13/12/2018.
//

import Foundation
import Vapor

public class UserGateway: Gateway {
    override var prefix: String { return "user" }
    
    public struct AvtokodUser: Content {
        public var login: String//, email, contacts, state, domain_uid, roles: String
        public var uid, name, comment, tags, created_by, updated_by: String
    }
    
    public typealias UserResponse = AvtokodResponse<AvtokodUser>
    
    public func user() throws -> Future<UserResponse> {
        return try request(to: "", method: .GET).flatMap { response in
            return try response.content.decode(UserResponse.self)
        }
    }
    
    public struct AvtokodUserReport: Content {
        public var domain_uid, report_type_uid, vehicle_id: String
        public struct Query: Codable {
            public var body, tags: String
        }
        public var query: Query
        var progress_ok, progress_wait, progress_error: Int
        public struct State: Content {
            public struct Source: Codable {
                var _id, state: String
            }
            public var sources: [Source]
        }
        public var state: State
        public var uid, name, comment, tags: String
    }
    
    public typealias ReportsResponse = AvtokodResponse<AvtokodUserReport>
    
    public func reports() throws -> Future<ReportsResponse> {
        return try request(to: "reports", method: .GET).flatMap { response in
            return try response.content.decode(ReportsResponse.self)
        }
    }
    
    public typealias ReportResponse = AvtokodResponse<Report>
    
    public func report(_ uid: String) throws -> Future<ReportResponse> {
        return try request(to: "reports/" + uid + "?_detailed=true&_content=true", method: .GET).flatMap { response in
            return try response.content.decode(ReportResponse.self)
        }
    }
    
    struct MakeReportRequest: Encodable {
        var queryType: ReportQueryType
        var query: String
        struct Options: Encodable {
            var force: Bool?
            struct WebHook: Encodable {
                var on_complete, on_update: String
            }
            var webhook: WebHook?
        }
        var options: Options?
        var reportUid: String?
    }
    
    public struct MakeReportResponseData: Content {
        var uid: String
        var isnew: Bool
        var process_request_uid: String
        var suggest_get: String //Date: 2018-12-15T01:43:54.203Z
    }
    
    public typealias MakeReportResponse = AvtokodResponse<MakeReportResponseData>
    
    public func makeReport(_ type: ReportQueryType, value: String) throws -> Future<MakeReportResponse> {
        var options: MakeReportRequest.Options? = nil
        if let webhook = root?.webhook {
            let wh = MakeReportRequest.Options.WebHook(on_complete: webhook, on_update: webhook)
            options = MakeReportRequest.Options(force: nil, webhook: wh)
        }
        let payload = MakeReportRequest(queryType: type, query: value, options: options, reportUid: nil)
        return try request(to: "reports/_make", method: .POST, beforeSend: { request in
            try request.content.encode(payload, as: .json)
        }).flatMap { response in
            return try response.content.decode(MakeReportResponse.self)
        }
    }
}
