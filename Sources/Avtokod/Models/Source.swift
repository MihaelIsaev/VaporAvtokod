//
//  Source.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation
import Vapor

public struct Source: Content {
    public var _id: String
    public var state: String
    public struct Data: Codable {
        var from_cache: Bool
        var real_status: String
    }
    public var data: Data?
}
