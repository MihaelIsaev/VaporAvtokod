//
//  String+md5.swift
//  App
//
//  Created by Mihael Isaev on 02.05.2018.
//

import Foundation
import Vapor
import Crypto

extension String {
    var md5: String {
        if let hex = try? MD5.hash(self).hexEncodedString() {
            let x = hex.split(by: hex.count / 16)
            //print(x)
            let ints = x.compactMap { Int($0) }
            //print(ints)
            let chars = ints.compactMap {
                Character(UnicodeScalar($0)!)
            }
            print("chars: " + String(chars))
            return String(chars)
        }
        return ""
    }
    
    
}

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()
        
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        
        return results.map { String($0) }
    }
}
