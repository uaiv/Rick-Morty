//
//  CharactersCell.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 11/05/2022.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    
    private let containerView = UIView()
    private let imageView = ImageView()
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
        
        containerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        
        containerView.addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.layer.backgroundColor = .init(red: 1000, green: 1000, blue: 1000, alpha: 1000)
        nameLabel.layer.opacity = 0.75
        nameLabel.layer.cornerRadius = 30
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50),
            nameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0)
        ])
        
    }
    
    func setData(with object: CharacterResultsModel) {
        nameLabel.text = object.name
        imageView.downloadImageFrom(urlString: object.image, imageMode: .scaleAspectFill)
    }
    
}

