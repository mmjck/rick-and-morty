//
//  CharacterViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 26/12/23.
//

import Foundation
import UIKit

final class CharacterViewController: UIViewController {
    private let characterListView = CharacterListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Characters"
        setupView()
        addSearchButton()
    }
    
    public func addSearchButton(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    public func setupView(){
        characterListView.delegate = self
        self.view.addSubview(characterListView)
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func didTapSearch() {
    }
    
}

extension CharacterViewController : CharacterListViewDelegate {
    func characterListView(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        
    }
    
    
}
