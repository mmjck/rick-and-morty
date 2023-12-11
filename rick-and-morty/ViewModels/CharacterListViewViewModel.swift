//
//  CharacterListViewViewModel.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 03/12/23.
//

import Foundation


protocol CharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didLoadMoreCharacters(with newIndexPaths: [IndexPath])
    
    func didSelectCharacter(_ character: Character)
}

final class CharacterListViewViewModel {
    public weak var delegate: CharacterListViewViewModelDelegate?
    private var isLoadingMoreCharacters = false
    
    
    private var characters: [Character] = [] {
        didSet {
//            for character in characters {
//                let viewModel = CharacterCollectionViewCellViewModel(name: character.name, status: character.status, imageUrl: URL(string: character.image))
//                
//                if !cellViewModels.contains(viewModel) {
//                    cellViewModels.append(viewModel)
//                }
//                
//            }
        }
    }
    
    
    private var cellViewModels: [CharacterCollectionViewCellViewModel] = []
}
