//
//  SearchViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 01/01/24.
//


import Foundation
import UIKit


final class SearchViewController: UIViewController {
    struct Config {
        enum `Type` {
            case character // name | status | gender
            case episode // name
            case location // name | type
            
            var endpoint: Endpoint {
                switch self {
                case .character: return .character
                case .episode: return .episode
                case .location: return .location
                }
            }
            
            
            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .location:
                    return "Search Location"
                case .episode:
                    return "Search Episode"
                }
            }
            
        }
        let type: `Type`
        
    }
    
    private let viewModel: SearchViewViewModel
    private let searchView: SearchView
    
    init(config: Config) {
        let viewModel = SearchViewViewModel(config: config)
        
        self.viewModel = viewModel
        self.searchView = SearchView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.title
        view.backgroundColor = .white
        view.addSubview(searchView)
        
        
        setHierarchy()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(didTapExecuteSearch))
    }
    
    
    @objc
    private func didTapExecuteSearch() {
        viewModel.executeSearch()
    }
}

extension SearchViewController{
    private func setHierarchy() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension SearchViewController: SearchViewDelegate {
    func searchView(_ searchView: SearchView, didSelectOption option: SearchInputViewViewModel.DynamicOption) {
        
    }
    
    func searchView(_ searchView: SearchView, didSelectLocation location: Location) {
        
    }
    
    func searchView(_ searchView: SearchView, didSelectCharacter character: Character) {
        
    }
    
    func searchView(_ searchView: SearchView, didSelectEpisode episode: Episode) {
        
    }
    
    
}
