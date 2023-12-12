//
//  EpisodeViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation
import UIKit


class EpisodesViewController: UIViewController {
    private let episodeListView =  EpisodeListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Episodes"
        self.view.backgroundColor = .white
        
        self.setupView()
        self.addSearchButton()
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
        episodeListView.delegate = self
        self.view.addSubview(episodeListView)
        NSLayoutConstraint.activate([
            episodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            episodeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            episodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

extension EpisodesViewController: EpisodeListViewDelegate {
    func removeEpisodeListView(_ characterListView: EpisodeListView, didSelectEpisode episode: Episode) {
        //        let detailVC = RMEpisodeDetailViewController(url: URL(string: episode.url))
        //        detailVC.navigationItem.largeTitleDisplayMode = .never
        //        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
