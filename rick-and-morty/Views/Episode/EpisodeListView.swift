//
//  EpisodeListView.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation
import UIKit



protocol EpisodeListViewDelegate: AnyObject {
    func removeEpisodeListView(_ characterListView: EpisodeListView, didSelectEpisode episode: Episode)
}


final class EpisodeListView: UIView {
    public weak var delegate:EpisodeListViewDelegate?
    
    private let viewModel = EpisodeListViewViewModel()
    
    
    private let spinner:  UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    
    private let collectionView = UICollectionView = {
        
    }()
}
