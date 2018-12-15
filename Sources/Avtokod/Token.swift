//
//  Token.swift
//  Avtokod
//
//  Created by Mihael Isaev on 13/12/2018.
//

import Foundation
import Crypto

struct Token {
    static var age: TimeInterval = 999999999
    
    var value: String
    var till: Date
    
    init (value: String, till: Date) {
        self.value = value
        self.till = till
    }
    
    static func generate(user: String, pass: String) throws -> String {
        let stamp = "\(Int64(Date().timeIntervalSince1970))"
        let age = "\(Int64(60 * 60 * 24))"
        let passHash = try pass.md5.encodeBase64()
        let saltedHash = try [stamp + age + passHash].joined(separator: ":").md5.encodeBase64()
        let token = try [user, stamp, age, saltedHash].joined(separator: ":").encodeBase64()
        return "AR-REST " + token
    }
}
