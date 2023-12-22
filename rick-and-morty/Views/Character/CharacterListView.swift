//
//  File.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 22/12/23.
//

import Foundation
import UIKit


protocol CharacterListViewDelegate: AnyObject {
    func characterListView(
        _ characterListView: CharacterListView,
        didSelectCharacter character: Character
    )
}


final class CharacterListView: UIView {
    public weak var delegate: CharacterListViewDelegate?
    private let viewModel =  CharacterListViewViewModel()
    
    
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    
    private lazy var collectionView: UICollectionView  = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)


        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        
//        collectionView.register(RMCharacterCollectionViewCell.self,
//                                forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
//        collectionView.register(RMFooterLoadingCollectionReusableView.self,
//                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
//                                withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension CharacterListView {
    private func setupUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        
        addSubview(collectionView)
        addSubview(spinner)
        
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.
        
        
    }
    private func configureTable(){
     
    }
    
    private func setHierarchy() {
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}



extension CharacterListView: CharacterListViewDelegate {
    func characterListView(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        
    }
    
    
}
