//
//  Model.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 3/2/23.
//

import Foundation


struct PlanetssData: Decodable {
    let planets: [Planets]
    
    private enum CodingKeys: String, CodingKey {
        case planets = "results"
    }
}

struct Planets: Decodable {
    
    let title: String?
    let rate: Double?
    let posterImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
