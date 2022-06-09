//
//  EpisodesCell.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit

final class EpisodeCell: UICollectionViewCell {
    
    private let containerView = UIView()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        contentView.addSubview(containerView)
        containerView.backgroundColor = .darkGray
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
   
        containerView.addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.layer.backgroundColor = .init(red: 1000, green: 1000, blue: 1000, alpha: 1000)
        nameLabel.layer.opacity = 0.75
        nameLabel.layer.cornerRadius = 10
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
    }
    
    func setData(with object: EpisodeResultsModel) {
        nameLabel.text = object.name
    }
    
}


