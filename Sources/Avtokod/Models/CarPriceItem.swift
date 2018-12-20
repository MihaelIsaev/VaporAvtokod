//
//  CarPriceItem.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public struct CarPriceItem: Codable {
    public struct Model: Codable {
        public var name: String?
    }
    public struct Modification: Codable {
        public var name: String?
    }
    public struct Engine: Codable {
        public var volume: Int64?
    }
    public var amount: Int64?
    public var model: Model?
    public var modification: Modification?
    public var engine: Engine?
    public var year: Int64?
}
