//
//  SearchView.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 30/12/23.
//

import Foundation
import UIKit

protocol SearchViewDelegate: AnyObject{
    func searchView(_ searchView: SearchView, didSelectOption option: SearchInputViewViewModel.DynamicOption)

    func searchView(_ searchView: SearchView, didSelectLocation location: Location)
    func searchView(_ searchView: SearchView, didSelectCharacter character: Character)
    func searchView(_ searchView: SearchView, didSelectEpisode episode: Episode)
}


final class SearchView: UIView
{
    weak var delegate: SearchViewDelegate?
    
    private let viewModel: SearchViewViewModel

    
    private let searchInputView = SearchInputView()

    private let noResultsView = NoSearchResultsView()

    // private let resultsView = SearchResultsView()

    init(frame: CGRect, viewModel: SearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchInputView)
        addSubview(noResultsView)
        // addSubview(resultsView)
        setHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchView {
    private func setHierarchy(){
        NSLayoutConstraint.activate([
            // Search input view
            searchInputView.topAnchor.constraint(equalTo: topAnchor),
            searchInputView.leftAnchor.constraint(equalTo: leftAnchor),
            searchInputView.rightAnchor.constraint(equalTo: rightAnchor),
            searchInputView.heightAnchor.constraint(equalToConstant: viewModel.config.type == .episode ? 55 : 110),

//            resultsView.topAnchor.constraint(equalTo: searchInputView.bottomAnchor),
//            resultsView.leftAnchor.constraint(equalTo: leftAnchor),
//            resultsView.rightAnchor.constraint(equalTo: rightAnchor),
//            resultsView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // No results
            noResultsView.widthAnchor.constraint(equalToConstant: 150),
            noResultsView.heightAnchor.constraint(equalToConstant: 150),
            noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    
    public func presentKeyboard() {
        searchInputView.presentKeyboard()
    }
}
