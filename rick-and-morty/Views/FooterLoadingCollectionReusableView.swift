//
//  FooterLoadingCollectionReusableView.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 03/12/23.
//

import Foundation
import UIKit


final class FooterLoadingCollectionReusableView: UICollectionReusableView {
        static let identifier = "FooterLoadingCollectionReusableView"
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()
        
}
