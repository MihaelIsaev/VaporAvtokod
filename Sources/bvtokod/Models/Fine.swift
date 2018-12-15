//
//  Fine.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public struct Fine: Codable {
    public struct Date: Codable {
        public var event: String
    }
    public var date: Date
    public struct Article: Codable {
        public var code, description: String
    }
    public var article: Article
    public var description: String
    public struct Vendor: Codable {
        public var name: String
    }
    public var vendor: Vendor
    public struct Amount: Codable {
        public var total: Int64
    }
    public var amount: Amount
    public struct Discount: Codable {
        public var percent: Int64
        public struct Date: Codable {
            public var end: String
        }
        public var date: Date
    }
    public var discount: Discount
    public var is_paid: Bool
    public struct Wire: Codable {
        public struct User: Codable {
            public var name, tin, kpp: String
        }
        public var user: User
        public struct Bank: Codable {
            public struct Account: Codable {
                public var number: String
            }
            public var account: Account
            public var name, bik: String
        }
        public var bank: Bank
        public struct Payment: Codable {
            public var purpose: String
        }
        public var payment: Payment
        public var kbk, okato: String
    }
    public var wire: Wire
}
