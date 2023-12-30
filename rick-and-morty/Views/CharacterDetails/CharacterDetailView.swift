//
//  CharacterEpisodeCollectionViewCell.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation
import UIKit


final class CharacterDetailView: UIView {
    
    private let viewModel: CharacterDetailViewViewModel
    public var collectionView: UICollectionView?
    
    
    
    
    init(frame: CGRect, viewModel: CharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        
        
        
        
        configureView()
        
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        setHierarchy()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CharacterDetailView {
    private func configureView(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        guard let collectionView = collectionView else {
            return
        }
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension CharacterDetailView {
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection{
        let sectionTypes = viewModel.sections
        switch sectionTypes[sectionIndex]  {
        case .photo:
            return viewModel.createPhotoSectionLayout()
        case .information:
            return viewModel.createInfoSectionLayout()
        case .episodes:
            return viewModel.createEpisodeSectionLayout()
        }
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CharacterPhotoCollectionViewCell.self,
                                forCellWithReuseIdentifier: CharacterPhotoCollectionViewCell.identifier)
        collectionView.register(CharacterInfoCollectionViewCell.self,
                                forCellWithReuseIdentifier: CharacterInfoCollectionViewCell.identifier)
        collectionView.register(CharacterEpisodeCollectionViewCell.self,
                                forCellWithReuseIdentifier: CharacterEpisodeCollectionViewCell.identifier)
        
        return collectionView
    }
}


