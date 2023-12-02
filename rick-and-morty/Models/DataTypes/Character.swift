//
//  Character.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation


struct Character: Codable {
    let id: Int
    let name: String
    let species: String
    let type: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    
    let status: CharacterStatus
    let gender: CharacterGender
    let origin: Origin
    let location: SingleLocation
    
    
    
}
