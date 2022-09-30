//
//  CharactersInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 11/05/2022.
//

import UIKit
import SnapKit

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
        title = characterObject?.name ?? ""
        containerView.snp.makeConstraints{ maker in
            maker.top.trailing.leading.bottom.equalToSuperview()
        }
        
        containerView.addSubview(imageView)
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.downloadImageFrom(urlString: characterObject?.image ?? "", imageMode: .scaleToFill)
        imageView.snp.makeConstraints{ maker in
            maker.top.equalTo(containerView.snp.top).offset(140)
            maker.centerX.equalTo(containerView)
            maker.width.height.equalTo(250)
        }
        
        containerView.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.text = "Name:   " + (characterObject?.name ?? "")
        nameLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(imageView.snp.bottom).offset(50)
            maker.leading.equalTo(containerView.snp.leading).offset(15)
        }
        
        containerView.addSubview(statusLabel)
        statusLabel.textColor = .white
        statusLabel.text = "Status:   " + (characterObject?.status ?? "")
        statusLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(nameLabel.snp.bottom).offset(10)
            maker.leading.equalTo(containerView.snp.leading).offset(15)
            }
        
        containerView.addSubview(speciesLabel)
        speciesLabel.textColor = .white
        speciesLabel.text = "Species:   " + (characterObject?.species ?? "")
        speciesLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(statusLabel.snp.bottom).offset(10)
            maker.leading.equalTo(containerView.snp.leading).offset(15)
        }
        
        containerView.addSubview(genderLabel)
        genderLabel.textColor = .white
        genderLabel.text = "Gender:   " + (characterObject?.gender ?? "")
        genderLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(speciesLabel.snp.bottom).offset(10)
            maker.leading.equalTo(containerView.snp.leading).offset(15)
        }
        
        containerView.addSubview(originLabel)
        originLabel.textColor = .white
        originLabel.text = "Origin:   " + (characterObject?.origin.name ?? "")
        originLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(genderLabel.snp.bottom).offset(10)
            maker.leading.equalTo(containerView.snp.leading).offset(15)
        }
        
        containerView.addSubview(locationLabel)
        locationLabel.textColor = .white
        locationLabel.text = "Location:   " + (characterObject?.location.name ?? "")
        locationLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(originLabel.snp.bottom).offset(10)
            maker.leading.equalTo(containerView.snp.leading).offset(15)
            maker.height.equalTo(25)
        }
        
    }
    
}

