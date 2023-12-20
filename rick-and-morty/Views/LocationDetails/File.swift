//
//  File.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 19/12/23.
//

import Foundation
import UIKit

protocol LocationDetailViewDelegate: AnyObject {
    func removeEpisodeDetailView(
        _ detailView: LocationDetailView,
        didSelect character: Character
    )
}


final class LocationDetailView: UIView{
    
    
    
    
    public weak var delegate: LocationDetailViewDelegate?
    private var viewModel: LocationDetailViewViewModel? {
        didSet {
            
        }
    }

    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    //    private lazy var collectionView: UICollectionView = {
    //        let layout = UICollectionViewCompositionalLayout() {
    //            section, _ in return self.layout(for)
    //        }
    //    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func  setupUI(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        //        let collectionView = createColectionView()
        //        addSubviews(collectionView, spinner)
        //        self.collectionView = collectionView
    }
    
    
    private func createColectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout() {
            section, _ in return self.layout(for: section)
        }
        
    }
    
}

extension LocationDetailView: LocationDetailViewDelegate {
    func removeEpisodeDetailView(_ detailView: LocationDetailView, didSelect character: Character) {
        
    }
    
    
    
    
    
}



extension LocationDetailView {
    func layout(for section: Int) -> NSCollectionLayoutSection {
        guard let sections = viewModel?.cellViewModels else {
            return createInfoLayout()
        }
        
        switch sections[section] {
        case .information:
            return createInfoLayout()
        case .characters:
            return createCharacterLayout()
        }
    }
    
    func createInfoLayout() -> NSCollectionLayoutSection {
        //
        //        let item = NSCollectionLayoutItem(layoutSize: .init(
        //            widthDimension: .fractionalWidth(1),
        //            heightDimension: .fractionalHeight(1))
        //        )
        //
        //        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        //
        //        let group = NSCollectionLayoutGroup.vertical(
        //            layoutSize: .init(widthDimension: .fractionalWidth(1),
        //                              heightDimension: .absolute(80)),
        //            subitems: [item]
        //        )
        //
        //        let section = NSCollectionLayoutSection(group: group)
        //
        //        return section
    }
    //
    func createCharacterLayout() -> NSCollectionLayoutSection {
        //        let item = NSCollectionLayoutItem(
        //            layoutSize: NSCollectionLayoutSize(
        //                widthDimension: .fractionalWidth(UIDevice.isiPhone ? 0.5 : 0.25),
        //                heightDimension: .fractionalHeight(1.0)
        //            )
        //        )
        //        item.contentInsets = NSDirectionalEdgeInsets(
        //            top: 5,
        //            leading: 10,
        //            bottom: 5,
        //            trailing: 10
        //        )
        //
        //        let group = NSCollectionLayoutGroup.horizontal(
        //            layoutSize:  NSCollectionLayoutSize(
        //                widthDimension: .fractionalWidth(1.0),
        //                heightDimension: .absolute(UIDevice.isiPhone ? 260 : 320)
        //            ),
        //            subitems: UIDevice.isiPhone ? [item, item] : [item, item, item, item]
        //        )
        //        let section = NSCollectionLayoutSection(group: group)
        //        return section
    }
}
