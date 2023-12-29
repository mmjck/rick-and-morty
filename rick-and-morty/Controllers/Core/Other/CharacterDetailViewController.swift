//
//  CharacterDetailViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 28/12/23.
//

import Foundation
import UIKit


final class CharacterDetailViewController: UIViewController {
    private let viewModel: CharacterDetailViewViewModel
    
    private let detailView: CharacterDetailView
    
    init(viewModel: CharacterDetailViewViewModel){
        self.viewModel = viewModel
        self.detailView = CharacterDetailView(frame: .zero, viewModel: viewModel)
        
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setHierarchy()
    }
}

extension CharacterDetailViewController {
    private func setupUI(){
        self.view.backgroundColor = .white
        title = viewModel.title
        view.addSubview(detailView)
    }
    
    private func setupButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare)
        )
    }
    
    @objc
    private func didTapShare() {
        // Share character info
    }
}


extension CharacterDetailViewController {
    private func setHierarchy() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


extension CharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        
        switch sectionType {
        case .photo: return 1
        case .information(let models):
            return models.count
        case .episodes(let models):
            return models.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
        
        switch sectionType {
        case .photo(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterPhotoCollectionViewCell.identifier, for: indexPath) as?
                    CharacterPhotoCollectionViewCell else {
                fatalError()
            }
            
            cell.configure(with: model)
            return cell
        case .information(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterInfoCollectionViewCell.identifier, for: indexPath) as?
                    CharacterInfoCollectionViewCell else {
                fatalError()
            }
            
            cell.configure(with: model)
            return cell
        case .episodes(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterEpisodeCollectionViewCell.identifier, for: indexPath) as?
                    CharacterEpisodeCollectionViewCell else {
                fatalError()
            }
            
            cell.configure(with: model)
            return cell
        }
        
    }
    
}

