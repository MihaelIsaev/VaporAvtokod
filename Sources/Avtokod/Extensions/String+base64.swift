//
//  String+base64.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation
import Vapor

extension String {
    func encodeBase64() throws -> String {
        if let base64 = data(using: String.Encoding.utf8)?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0)) {
            return base64
        }
        throw Abort(.expectationFailed, reason: "Can't encode string to base64")
    }
}
