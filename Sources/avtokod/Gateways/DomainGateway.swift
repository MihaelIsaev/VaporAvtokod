//
//  DomainGateway.swift
//  Avtokod
//
//  Created by Mihael Isaev on 13/12/2018.
//

import Foundation
import Vapor

public class DomainGateway: Gateway {
    override var prefix: String { return "domain" }
}
