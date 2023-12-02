//
//  EpisodeViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation

import UIKit


class EpisodeViewController: UIViewController {
//    private let episodeListView =  EpisodeListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        title = "Episodes"
        
        setupView()
        addSearchButton()
    }
    
    
    private func addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch(){
        //        let vc = RMSearchViewController(config: .init(type: .episode))
        //        vc.navigationItem.largeTitleDisplayMode = .never
        //        navigationController?.pushViewController(vc, animated: true)
    }


    private func setupView(){
        
    }
    
}
