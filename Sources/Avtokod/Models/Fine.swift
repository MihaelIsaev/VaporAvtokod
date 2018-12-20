//
//  Fine.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public struct Fine: Codable {
    public struct Date: Codable {
        public var event: String?
    }
    public struct Article: Codable {
        public var code, description: String?
    }
    public struct Vendor: Codable {
        public var name: String?
    }
    public struct Amount: Codable {
        public var total: Int64?
    }
    public struct Discount: Codable {
        public struct Date: Codable {
            public var end: String?
        }
        public var percent: Int64?
        public var date: Date?
    }
    public struct Wire: Codable {
        public struct User: Codable {
            public var name, tin, kpp: String?
        }
        public struct Bank: Codable {
            public struct Account: Codable {
                public var number: String?
            }
            public var account: Account?
            public var name, bik: String?
        }
        public struct Payment: Codable {
            public var purpose: String?
        }
        public var user: User?
        public var bank: Bank?
        public var payment: Payment?
        public var kbk, okato: String?
    }
    public var date: Date?
    public var article: Article?
    public var description: String?
    public var vendor: Vendor?
    public var amount: Amount?
    public var discount: Discount?
    public var is_paid: Bool?
    public var wire: Wire?
}
