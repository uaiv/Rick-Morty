//
//  EpisodesCell.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit

final class EpisodeCell: UICollectionViewCell {
    
    private let conteinerView = UIView()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        contentView.addSubview(conteinerView)
        contentView.backgroundColor = .red
        conteinerView.backgroundColor = .purple
        conteinerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            conteinerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            conteinerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
   
        conteinerView.addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.layer.backgroundColor = .init(red: 1000, green: 1000, blue: 1000, alpha: 1000)
        nameLabel.layer.opacity = 0.75
        nameLabel.layer.cornerRadius = 30
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -50),
            nameLabel.leftAnchor.constraint(equalTo: conteinerView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: conteinerView.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: 0)
        ])
    }
    
    func setData(with object: EpisodeResultsModel) {
        nameLabel.text = object.name
    }
    
}


