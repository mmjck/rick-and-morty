//
//  LocationViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 12/12/23.
//

import Foundation
import UIKit

final class  LocationViewController: ViewController,
                                     LocationViewViewModelDelegate,LocationViewDelegate {
    
    
    // private let primaryView = LocationView()
    
    // private viewModel = LocationViewViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // primaryView.delegate = self
        // self.view.addSubview(primaryView)
        self.view.backgroundColor = .white
        self.title = "Locations"
        
        
        self.addSearchButton()
        self.addConstraints()
        
    }
    
    
    private func addConstraints()
    {
        
    }
    private func  addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
        
    }
    
    
    @objc private func didTapSearch() {
        //        let vc = RMSearchViewController(config: .init(type: .location))
        //        vc.navigationItem.largeTitleDisplayMode = .never
        //        navigationController?.pushViewController(vc, animated: true)
    }
    
    func removeLocationView(_ locationView: LocationView, didSelect location: Location){
        
    }
    
    func didFetchInitialLocations() {
        // primaryView.configure
    }
}
