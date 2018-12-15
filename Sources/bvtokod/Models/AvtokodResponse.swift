//
//  AvtokodResponse.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation
import Vapor

public struct AvtokodResponse<T: Content>: Content {
    public var state: ResponseState
    public var size: Int
    public var stamp: String //Date: 2018-12-15T01:43:54.299Z
    public var data: [T]
}
