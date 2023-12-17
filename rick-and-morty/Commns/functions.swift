//
//  functions.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 17/12/23.
//

import Foundation

class CommonsFunctions {
    func hash(into hasher: inout Hasher, properties: [String]) {
        for i in properties {
            hasher.combine(i)
        }
        
    }
}
