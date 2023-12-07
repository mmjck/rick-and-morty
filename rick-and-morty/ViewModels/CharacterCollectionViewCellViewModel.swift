//
//  CharacterCollectionViewCellViewModel.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 03/12/23.
//

import Foundation


final class CharacterCollectionViewCellViewModel {
    public let name: String
    private let status: CharacterStatus
    private let imageUrl: URL?
    
    
    init(name: String, status: CharacterStatus, imageUrl: URL?) {
        self.name = name
        self.status = status
        self.imageUrl = imageUrl
    }
    
    public var statusText: String {
        return "Status: \(status.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        
    }
    
    
    static func == (lhs: CharacterCollectionViewCellViewModel, rhs: CharacterCollectionViewCellViewModel) -> Bool {
        return lhs.name.hashValue == rhs.hashValue
    }
    
    
    func hash(into hasher: inout Hasher){
        hasher.combine(name)
        hasher.combine(status)
        hasher.combine(imageUrl)
        
    }
    
}
