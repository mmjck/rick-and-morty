//
//  LocationDetailViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 22/12/23.
//

import Foundation
import UIKit

final class LocationDetailViewController: UIViewController {
    private let viewModel: LocationDetailViewViewModel
    private let detailView =  LocationDetailView()
    
    init(location: Location) {
        let url = URL(string: location.url)
        self.viewModel = LocationDetailViewViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        config()
        setHierarchy()
    }
    
}

extension LocationDetailViewController {
    
    private func config(){
        detailView.delegate = self
        viewModel.delegate = self
        viewModel.fetchLocationData()
        
    }
    
    private func setupUI(){
        view.backgroundColor  = .white
        view.addSubview(detailView)
        
        title = "Location"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))

    }
    
    private func setHierarchy(){
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


extension LocationDetailViewController {
    @objc
    private func didTapShare() {
        
    }
}


extension LocationDetailViewController: LocationDetailViewViewModelDelegate, LocationDetailViewDelegate {
    func didFetchLocationDetails() {
        detailView.configure(with: viewModel)
    }
    
    func episodeDetailView(_ detailView: LocationDetailView, didSelect character: Character) {
//        let vc = CharacterDetailViewController(viewModel: .init(character: character))
//        vc.title = character.name
//        vc.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
