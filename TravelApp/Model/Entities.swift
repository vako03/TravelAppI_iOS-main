//
//  Entities.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 3/9/23.
//

import UIKit


struct APIData: Decodable{
    var error: Bool = false
    var message: String = ""
    var count: Int = 0
    var places: [Places] = [Places]()
}

struct Menu: Decodable{
    var id: Int
    var name: String
}

struct Places: Decodable{
    let id: Int
    let name: String
    let description: String?
    let address: String?
    let longitude: Double?
    let latitude: Double?
    let like: Int?
    let image: String
}

struct Review {
    let placeID: Int
    let photo: UIImage
    let title: String
    let username: String
    let description: String
}

struct Galery{
    let placeID: Int
    let placeImage: String
}
