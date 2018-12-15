//
//  CarPriceItem.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public struct CarPriceItem: Codable {
    public var amount: Int64
    public struct Model: Codable {
        public var name: String
    }
    public var model: Model
    public struct Modification: Codable {
        public var name: String
    }
    public var modification: Modification
    public struct Engine: Codable {
        public var colume: Int64
    }
    public var engine: Engine
    public var year: Int64
}
