//
//  SettingsViewController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 11/12/23.
//

import StoreKit
import SafariServices
import SwiftUI
import UIKit

final class SettingsViewController: UIViewController{
    
    private var settingsSwiftUIController: UIHostingController<SettingsView>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        print("called")
        view.backgroundColor = .white
        self.title = "Settings"
        
        self.addSwiftUIController()
    }
    
    
    private func addSwiftUIController(){
        let settingsSwiftUIController = UIHostingController(rootView: SettingsView(viewModel: SettingsViewViewModel(cellViewModels: SettingsOption.allCases.compactMap( {
            return SettingsCellViewModel(type: $0) {
                [weak self] option in self?.handleTap(option: option)
            }
        }))))
        
        
        self.addChild(settingsSwiftUIController)
        settingsSwiftUIController.didMove(toParent: self)
        
        
        view.addSubview(settingsSwiftUIController.view)
        settingsSwiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            settingsSwiftUIController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsSwiftUIController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        self.settingsSwiftUIController = settingsSwiftUIController
        
    }
    
    
    
    
    private func handleTap(option: SettingsOption) {
        guard Thread.current.isMainThread else {
            return
        }
        
        if let url = option.targetUrl {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }else {
            if let windowScene = view.window?.windowScene {
                SKStoreReviewController.requestReview(in: windowScene)
            }
        }
    }
}
