//
//  CharactersCell.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 11/05/2022.
//

import UIKit
import SnapKit

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
        containerView.backgroundColor = .gray
        containerView.snp.makeConstraints { maker in
            maker.top.bottom.leading.trailing.equalToSuperview()
        }
        
        containerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.snp.makeConstraints{ maker in
            maker.top.equalTo(containerView).inset(5)
            maker.leading.trailing.equalToSuperview().inset(10)
            maker.height.equalTo(UIScreen.main.bounds.height * 0.2)
        }
        
        containerView.addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.layer.backgroundColor = .init(red: 1000, green: 1000, blue: 1000, alpha: 1000)
        nameLabel.layer.opacity = 0.75
        nameLabel.layer.cornerRadius = 30
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(imageView.snp.bottom).inset(50)
            maker.leading.trailing.bottom.equalTo(imageView)
        }
        
    }
    
    func setData(with object: CharacterResultsModel) {
        nameLabel.text = object.name
        imageView.downloadImageFrom(urlString: object.image, imageMode: .scaleAspectFill)
    }
    
}

