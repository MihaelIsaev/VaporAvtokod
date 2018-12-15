//
//  CustomsHistoryItem.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public struct CustomsHistoryItem: Codable {
    public struct Date: Codable {
        public var event: String
    }
    public var date: Date
    public struct Price: Codable {
        public var amount: Int64
    }
    public var price: Price
    public struct Country: Codable {
        public struct From: Codable {
            public var name: String
        }
        public var from: From
    }
    public var country: Country
}
