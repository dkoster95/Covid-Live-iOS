//
//  Country.swift
//  Entities
//
//  Created by Daniel Koster on 4/4/21.
//

import Foundation

public struct Country: Codable {
    let country: String
    let code: String
    let confirmed: Int
    let recovered: Int
    let critical: Int
    let deaths: Int
    let latitude: Double
    let longitude: Double
    let lastChange: String?
    let lastUpdate: String?
}
