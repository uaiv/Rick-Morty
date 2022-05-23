//
//  Menu.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 17/05/2022.
//

import UIKit

class SectionsViewController: UIViewController {

    let characters = UIButton()
    let locations = UIButton()
    let episodes = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
}

extension SectionsViewController {
    
    func setupSubviews() {
        view.backgroundColor = .gray
        
        view.addSubview(characters)
        characters.translatesAutoresizingMaskIntoConstraints = false
        characters.setTitle("Characters", for: .normal)
        characters.setTitleColor(.blue, for: .normal)
        characters.backgroundColor = .white
//        characters.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        characters.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 40).isActive = true
//        characters.addTarget(self, action: #selector(update), for: .touchUpInside)
        
        view.addSubview(locations)
        locations.translatesAutoresizingMaskIntoConstraints = false
        locations.setTitle("Locations", for: .normal)
        locations.setTitleColor(.black, for: .normal)
        locations.backgroundColor = .white
        
        
        view.addSubview(episodes)
        episodes.translatesAutoresizingMaskIntoConstraints = false
        episodes.setTitle("Episodes", for: .normal)
        episodes.setTitleColor(.black, for: .normal)
        episodes.backgroundColor = .white
        
        
        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: view.topAnchor),
//            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
            characters.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            characters.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            locations.topAnchor.constraint(equalTo: characters.bottomAnchor, constant: 10),
            locations.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            locations.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            
            episodes.topAnchor.constraint(equalTo: locations.bottomAnchor, constant: 5),
            episodes.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            episodes.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            
//            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
//            speciesLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
//            speciesLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            
       ])
    }
    
    @objc func update() {

    }
}

