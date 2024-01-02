//
//  Endpoints.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 30/11/23.
//

import Foundation


@frozen enum Endpoint: String, CaseIterable, Hashable {
    case character
    case location
    case episode
}
