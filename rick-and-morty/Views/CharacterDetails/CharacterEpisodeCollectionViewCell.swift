//
//  CharacterEpisodeCollectionViewCell.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation
import UIKit


final class CharacterEpisodeCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier: String = "CharacterEpisodeCollectionViewCell"
    
    
    private lazy var seasonLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    
    private lazy var airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        setHierarchy()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for label in [seasonLabel, nameLabel, airDateLabel] {
            label.text = nil
        }
    }
    
    
    public func configure(with viewModel: CharacterEpisodeCollectionViewCellViewModel) {
        viewModel.registerForData {
            [weak self] data in
            self?.nameLabel.text = data.name
            self?.seasonLabel.text = "Episode "+data.episode
            self?.airDateLabel.text = "Aired on "+data.air_date
        }
        
        viewModel.fetchEpisode()
        contentView.layer.borderColor = viewModel.borderColor.cgColor
    }
    
}


extension CharacterEpisodeCollectionViewCell {
    public func configureView(){
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        
        
        contentView.addSubview(seasonLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(airDateLabel)
        
    }
    
    public func setHierarchy() {
        NSLayoutConstraint.activate([
            seasonLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            seasonLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            seasonLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            seasonLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            nameLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
        ])
    }
}


