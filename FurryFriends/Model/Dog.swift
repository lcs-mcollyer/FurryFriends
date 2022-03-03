//
//  Model.swift
//  FurryFriends
//
//  Created by Matthew Collyer on 2022-03-01.
//

import Foundation


struct DogImage: Decodable, Hashable, Encodable{
    let message: String
    let status: Int
}
