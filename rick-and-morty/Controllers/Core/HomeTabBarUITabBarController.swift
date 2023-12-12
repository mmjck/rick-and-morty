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
        let charactersVC = ViewController()
        let locationsVC = ViewController()
        let episodesVC = EpisodesViewController()
        let settingVC = SettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .always
        locationsVC.navigationItem.largeTitleDisplayMode = .always
        episodesVC.navigationItem.largeTitleDisplayMode = .always
        settingVC.navigationItem.largeTitleDisplayMode = .always
        
        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingVC)

        
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }

}
