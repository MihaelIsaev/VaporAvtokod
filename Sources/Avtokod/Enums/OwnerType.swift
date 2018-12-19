//
//  OwnerType.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public enum OwnerType: String, Codable {
    case person = "PERSON"
    case legal = "LEGAL"
    public var stringValue: String {
        switch self {
        case .person: return "Физическое лицо"
        case .legal: return "Юридическое лицо"
        }
    }
}
