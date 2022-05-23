//
//  DetailViewController.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 11/05/2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private var object: (image: String, name: String, status: String, species: String,
                         gender: String, origin: String, location: String)?
    init(with object: (image: String, name: String, status: String, species: String,
                       gender: String, origin: String, location: String)) {
        super.init(nibName: nil, bundle: nil)
        self.object = object
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        object = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
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

private extension InfoViewController {
    
    private func setupSubviews() {
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        title = object?.name ?? ""
        
        view.addSubview(containerView)
        containerView.backgroundColor = .darkGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
//        containerView.addSubview(titleLabel)
//        titleLabel.textColor = .systemGreen
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.text = object?.name ?? ""
        
        containerView.addSubview(imageView)
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.downloadImageFrom(urlString: object?.image ?? "", imageMode: .scaleAspectFill)
        
        containerView.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name:   " + (object?.name ?? "")
        
        containerView.addSubview(statusLabel)
        statusLabel.textColor = .white
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Status:   " + (object?.status ?? "")
        
        containerView.addSubview(speciesLabel)
        speciesLabel.textColor = .white
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.text = "Species:   " + (object?.species ?? "")
        
        containerView.addSubview(genderLabel)
        genderLabel.textColor = .white
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender:   " + (object?.gender ?? "")
        
        containerView.addSubview(originLabel)
        originLabel.textColor = .white
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.text = "Origin:   " + (object?.origin ?? "")
        
        containerView.addSubview(locationLabel)
        locationLabel.textColor = .white
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = "Location:   " + (object?.location ?? "")
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            nameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            statusLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            speciesLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            speciesLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 5),
            genderLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            genderLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            originLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5),
            originLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            originLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
            locationLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 5),
            locationLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            locationLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            locationLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
}
