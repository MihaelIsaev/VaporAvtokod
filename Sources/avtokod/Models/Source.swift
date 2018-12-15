//
//  Source.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation
import Vapor

public struct Source: Content {
    public var _id: SourceType
    public var state: SourceState
    public struct Data: Codable {
        var from_cache: Bool
        var real_status: SourceState
    }
    public var data: Data
}
