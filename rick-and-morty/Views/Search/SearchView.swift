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

    private let resultsView = SearchResultsView()

}
