//
//  LocationViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 12/12/23.
//

import Foundation
import UIKit

final class  LocationViewController: ViewController
{
    
    
    private let primaryView = LocationView()
    
    private var viewModel = LocationViewViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        primaryView.delegate = self
        self.view.addSubview(primaryView)
        self.view.backgroundColor = .white
        self.title = "Locations"
        
        
        self.addSearchButton()
        self.addConstraints()
        
        viewModel.delegate = self
        viewModel.didFetchInitialLocations()
        
    }
    
    private func addConstraints()
    {
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    private func  addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
        
    }
    
    
    @objc private func didTapSearch() {
        //        let vc = RMSearchViewController(config: .init(type: .location))
        //        vc.navigationItem.largeTitleDisplayMode = .never
        //        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}


extension LocationViewController: LocationViewViewModelDelegate{
    func didFetchInitialLocations() {
        primaryView.configure(with: viewModel)
    }
}


extension LocationViewController: LocationViewDelegate{
    func removeLocationView(_ locationView: LocationView, didSelect location: Location){
        
    }
}
