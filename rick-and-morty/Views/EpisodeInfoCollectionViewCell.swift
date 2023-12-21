//
//  EpisodeInfoCollectionViewCell.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 21/12/23.
//

import Foundation
import UIKit

final class EpisodeInfoCollectionViewCell: UICollectionViewCell{
    
    
    static let identifier = "EpisodeInfoCollectionViewCell"
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setHierarchy()
    }
    
    
    private func setupUI(){
        self.contentView.backgroundColor = .secondarySystemBackground
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(valueLabel)
    }
    
    private func setHierarchy(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.47),
            valueLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.47)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        for label in [titleLabel, valueLabel] {
            label.text = nil
        }
    }
    
    func configure(with viewModel: EpisodeInfoCollectionViewCellViewModel){
        titleLabel.text = viewModel.title
        value.text = viewModel.value
    }
    
}
