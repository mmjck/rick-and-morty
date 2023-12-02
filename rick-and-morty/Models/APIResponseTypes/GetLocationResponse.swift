//
//  GetLocationResponse.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation


struct GetAllLocationsResponse: Codable {
    let info: Info
    let results: [Location]
}
