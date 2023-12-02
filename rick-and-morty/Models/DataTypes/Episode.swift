//
//  Episode.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation

protocol EpisodeDataRender {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

struct Episode: Codable, EpisodeDataRender {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    
    let characters: [String]
    let url: String
    let created: String
}
