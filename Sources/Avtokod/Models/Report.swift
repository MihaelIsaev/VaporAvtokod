//
//  Report.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation
import Vapor

public struct Report: Content {
    public var domain_uid, report_type_uid, vehicle_id: String
    public var uid, name, comment, tags, created_at, created_by: String
    public var updated_at, updated_by, active_from, active_to: String
    public struct Query: Codable {
        var type: ReportQueryType
        var body: String
    }
    public var query: Query
    public var progress_ok, progress_wait, progress_error: Int
    public struct State: Codable {
        public var sources: [Source]
        public var content: ReportContent
    }
    public var state: State
}
