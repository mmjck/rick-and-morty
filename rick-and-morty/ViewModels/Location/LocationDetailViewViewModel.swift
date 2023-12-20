//
//  LocationDetailViewViewModel.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 19/12/23.
//

import Foundation

protocol LocationDetailViewViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

final class LocationDetailViewViewModel {
    private let endpointUrl: URL? = nil
    public
    private var dataTuple: (location: Location, characters: [Character])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchLocationDetails()
            
        }
    }
    enum SectionType {
        case information(viewModels: [EpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [CharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: LocationDetailViewViewModelDelegate?
    public private(set) var cellViewModels: [SectionType] = []
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    public func character(at index: Int) -> Character? {
        guard let dataTuple = dataTuple else {
            return nil
        }
        
        return dataTuple.characters[index]
    }
    
    private func createCellViewModels() {
        guard let dataTuple = dataTuple else { return }
        
        let location = dataTuple.location
        let characters = dataTuple.characters
        
        var createString = location.created
        if let date = CharacterInfoCollectionViewCellViewModel.dateFormatter.date(from: location.created) {
            createdString = CharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date)
        }
        
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Location Name", value: location.name),
                .init(title: "Type", value: location.type),
                .init(title: "Dimension", value: location.dimension),
                .init(title: "Created", value: createdString),
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
            }))
        ]
        
    }
}
