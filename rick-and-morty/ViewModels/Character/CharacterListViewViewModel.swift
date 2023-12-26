//
//  CharacterListViewViewModel.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 03/12/23.
//

import Foundation
import UIKit

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
            for character in characters {
                let viewModel = CharacterCollectionViewCellViewModel(name: character.name, status: character.status, imageUrl: URL(string: character.image))
                
                if !cellViewModels.contains(viewModel) {
                    cellViewModels.append(viewModel)
                }
                
            }
        }
    }
    
    
    private var cellViewModels: [CharacterCollectionViewCellViewModel] = []
    private var apiInfo: GetAllCharactersResponse.Info
    
    public shouldShowLoadMoreIndicator() -> Bool {
        return apiInfo.next != nil
    }
    
    public func fetchCharacters(){
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) {
            [weak self] result in
            
            switch result {
            case .success(let response):
                
                self?.characters = response.result
                self?.apiInfo = response.info
                
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
            case .failure(let error)
            }
        }
    }
}


extension CharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            UICollectionViewCell()
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
              let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterLoadingCollectionReusableView.identifier, for: indexPath) as?FooterLoadingCollectionReusableView  else {
            fatalError()
        }
        
        footer.startAnimating()
        return footer
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreIndicator() else {
            return .zero
        }
        
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 2)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        
        delegate?.didSelectCharacter(character)
        
    }
    
}
