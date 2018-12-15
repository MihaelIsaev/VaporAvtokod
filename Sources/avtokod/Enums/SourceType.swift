//
//  SourceType.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public enum SourceType: String, Codable {
    case avTaxi = "av.taxi"
    case base
    case baseExt = "base.ext"
    case calcOsago = "calc.osago"
    case carfaxCheck = "carfax.check"
    case carprice
    case customsBase = "customs.base"
    case finesBase = "fines.base"
    case gibddDTP = "gibdd.dtp"
    case gibddHistory = "gibdd.history"
    case gibddRestrict = "gibdd.restrict"
    case gibddWanted = "gibdd.wanted"
    case pledge
    case ramiOsago = "ramiosago.base"
    case referencesBase = "references.base"
    case subBase = "sub.base"
    case techExt = "tech.ext"
}
