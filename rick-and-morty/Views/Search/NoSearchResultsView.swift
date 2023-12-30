//
//  NoSearchResultsView.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 30/12/23.
//

import Foundation
import UIKit

final class NoSearchResultsView: UIView {
    private let viewModel = NoSearchResultsViewViewModel()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor  = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = true
        addSubview(iconView)
        addSubview(label)
        
        setHierarchy()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension NoSearchResultsView {
    private func setHierarchy(){
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 90),
            iconView.heightAnchor.constraint(equalToConstant: 90),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            label.leftAnchor.constraint(equalTo: leftAnchor),
            label.rightAnchor.constraint(equalTo: rightAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
        ])
    }
    
    private func configure(){
        label.text = viewModel.title
        iconView.image = viewModel.image
    }
}
