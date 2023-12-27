//
//  HomeTabBarUITabBarController.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 30/11/23.
//

import UIKit

class HomeTabBarUITabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabs()
        
    }
    
    
    private func setupTabs(){
        let charactersVC = CharacterViewController()
        let locationsVC = LocationViewController()
        let episodesVC = EpisodesViewController()
        let settingVC = SettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .always
        locationsVC.navigationItem.largeTitleDisplayMode = .always
        episodesVC.navigationItem.largeTitleDisplayMode = .always
        settingVC.navigationItem.largeTitleDisplayMode = .always
        
        
        let charactersNav = UINavigationController(rootViewController: charactersVC)
        let locationsNav = UINavigationController(rootViewController: locationsVC)
        let episodesNav = UINavigationController(rootViewController: episodesVC)
        let settingNav = UINavigationController(rootViewController: settingVC)
        
        
        charactersNav.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        locationsNav.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        episodesNav.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        settingNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        
        
        for nav in [charactersNav, locationsNav, episodesNav, settingNav] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([charactersNav, locationsNav, episodesNav, settingNav],
                           animated: true
        )
    }
    
}
