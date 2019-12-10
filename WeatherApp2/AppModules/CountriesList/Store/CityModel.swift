
//
//  CityModel.swift
//  WeatherApp2
//
//  Created by mohamed gamal mohamed on 9/30/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import Foundation

// MARK: - CityModelElement
struct CityModel: Codable {
    let id: Int?
    let name, country: String?
    let coord: Coordinates?
}

// MARK: - Coord
struct Coordinates: Codable {
    let lon, lat: Double?
}

typealias Cities = [CityModel]
