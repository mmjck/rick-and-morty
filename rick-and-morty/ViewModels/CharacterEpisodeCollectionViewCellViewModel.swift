//
//  CharacterEpisodeCollectionViewCellViewModel.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 07/12/23.
//

import Foundation
import UIKit


protocol EpisodeDataRender {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class CharacterEpisodeCollectionViewCellViewModel: Hashable, Equatable {
    private let episodeDataUrl: URL?
    private var isFetching = false
    private var dataBlock: ((EpisodeDataRender) -> Void)?
    
    
    public let borderColor: UIColor
    
    private var episode: Episode? {
        didSet {
            guard let model = episode else { return }
            dataBlock?(model)
        }
    }
    
    init(episodeDataUrl: URL?, borderColor: UIColor = .systemBlue) {
        self.episodeDataUrl = episodeDataUrl
        self.borderColor = borderColor
    }
    
    public func registerForData(_ block: @escaping (EpisodeDataRender) ->  Void){
        self.dataBlock = block
    }
    
    
    public func fetchEpisode(){
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        
        
        guard let url = episodeDataUrl, let request = Request(url: url) else {
            return
        }
        
        
        isFetching = true
        
        
        Service.shared.execute(request, expecting: Episode.self)  {
            [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let error):
                print(String(describing: error))
            }
            
            
        }
    }
    
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.episodeDataUrl?.absoluteString ?? "")
    }
    
    
    static func == (lhs: CharacterEpisodeCollectionViewCellViewModel, rhs: CharacterEpisodeCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
        
    }
}
