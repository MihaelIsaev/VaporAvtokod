//
//  RegistrationAction.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public struct RegistrationAction: Codable {
    public struct Date: Codable {
        var start: String?
        var end: String?
    }
    public var date: Date?
    public var reg_num: String?
    public var owner: Owner?
    public var type: String?
    public struct Geo: Codable {
        public var region: String
    }
    public var geo: Geo?
}
