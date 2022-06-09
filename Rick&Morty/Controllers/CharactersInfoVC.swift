//
//  CharactersInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 11/05/2022.
//

import UIKit

class CharactersInfoVC: UIViewController {
    
    var characterObject: CharacterResultsModel?
    
    private let containerView = UIView()
    private let imageView = ImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let speciesLabel = UILabel()
    private let genderLabel = UILabel()
    private let originLabel = UILabel()
    private let locationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
}

private extension CharactersInfoVC {
    
    private func setupSubviews() {
        
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        title = characterObject?.name ?? ""
        
        containerView.addSubview(imageView)
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.downloadImageFrom(urlString: characterObject?.image ?? "", imageMode: .scaleToFill)
        
        containerView.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name:   " + (characterObject?.name ?? "")
        
        containerView.addSubview(statusLabel)
        statusLabel.textColor = .white
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Status:   " + (characterObject?.status ?? "")
        
        containerView.addSubview(speciesLabel)
        speciesLabel.textColor = .white
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.text = "Species:   " + (characterObject?.species ?? "")
        
        containerView.addSubview(genderLabel)
        genderLabel.textColor = .white
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender:   " + (characterObject?.gender ?? "")
        
        containerView.addSubview(originLabel)
        originLabel.textColor = .white
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.text = "Origin:   " + (characterObject?.origin.name ?? "")
        
        containerView.addSubview(locationLabel)
        locationLabel.textColor = .white
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = "Location:   " + (characterObject?.location.name ?? "")
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 140),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            nameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            statusLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            speciesLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            speciesLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10),
            genderLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            genderLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            originLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            originLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            originLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            locationLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10),
            locationLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            locationLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            locationLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
    }
    
}

