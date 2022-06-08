//
//  CharsColletionView.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 31/05/2022.
//

import UIKit

final class SectionsVC: UIViewController {
    
    let charactersButton = UIButton()
    let locationsButton = UIButton()
    let episodesButton = UIButton()
    let charactersButtonTitle = UILabel()
    let locationsButtonTitle = UILabel()
    let episodesButtonTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    
    }
    
    
    func setupSubviews() {
        
        view.backgroundColor = .gray
        
        view.addSubview(charactersButton)
        charactersButton.clipsToBounds = true
        charactersButton.contentMode = .scaleAspectFill
        charactersButton.setImage(UIImage(named: "3.png"), for: .normal)
        charactersButton.translatesAutoresizingMaskIntoConstraints = false
        charactersButton.layer.cornerRadius = 25
        charactersButton.addTarget(self, action: #selector(tapCharactersButton), for: .touchUpInside)
        
        view.addSubview(charactersButtonTitle)
        charactersButtonTitle.backgroundColor = .white
        charactersButtonTitle.layer.opacity = 0.75
        charactersButtonTitle.clipsToBounds = true
        charactersButtonTitle.contentMode = .scaleAspectFill
        charactersButtonTitle.text = "Characters"
        charactersButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        charactersButtonTitle.textColor = .black
        charactersButtonTitle.textAlignment = .center
        charactersButtonTitle.font = .boldSystemFont(ofSize: 35.0)
        charactersButtonTitle.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            charactersButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            charactersButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            charactersButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            charactersButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.22),
            charactersButtonTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            charactersButtonTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            charactersButtonTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            charactersButtonTitle.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.22)
        ])
                
        view.addSubview(locationsButton)
        locationsButton.clipsToBounds = true
        locationsButton.contentMode = .scaleAspectFill
        locationsButton.translatesAutoresizingMaskIntoConstraints = false
        locationsButton.layer.cornerRadius = 25
        locationsButton.setImage(UIImage(named: "4.png"), for: .normal)
        locationsButton.addTarget(self, action: #selector(tapLocationsButton), for: .touchUpInside)

        view.addSubview(locationsButtonTitle)
        locationsButtonTitle.backgroundColor = .white
        locationsButtonTitle.layer.opacity = 0.75
        locationsButtonTitle.clipsToBounds = true
        locationsButtonTitle.contentMode = .scaleAspectFill
        locationsButtonTitle.text = "Locations"
        locationsButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        locationsButtonTitle.textColor = .black
        locationsButtonTitle.textAlignment = .center
        locationsButtonTitle.font = .boldSystemFont(ofSize: 35.0)
        locationsButtonTitle.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            locationsButton.topAnchor.constraint(equalTo: charactersButton.bottomAnchor, constant: 30),
            locationsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            locationsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            locationsButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.22),
            locationsButtonTitle.topAnchor.constraint(equalTo: charactersButtonTitle.bottomAnchor, constant: 30),
            locationsButtonTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            locationsButtonTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            locationsButtonTitle.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.22)
        ])

        view.addSubview(episodesButton)
        episodesButton.clipsToBounds = true
        episodesButton.contentMode = .scaleAspectFill
        episodesButton.translatesAutoresizingMaskIntoConstraints = false
        episodesButton.layer.cornerRadius = 25
        episodesButton.setImage(UIImage(named: "5.png"), for: .normal)
        episodesButton.addTarget(self, action: #selector(tapEpisodesButton), for: .touchUpInside)

        view.addSubview(episodesButtonTitle)
        episodesButtonTitle.backgroundColor = .white
        episodesButtonTitle.layer.opacity = 0.75
        episodesButtonTitle.clipsToBounds = true
        episodesButtonTitle.contentMode = .scaleAspectFill
        episodesButtonTitle.text = "Episodes"
        episodesButtonTitle.textColor = .black
        episodesButtonTitle.textAlignment = .center
        episodesButtonTitle.font = .boldSystemFont(ofSize: 35.0)
        episodesButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        episodesButtonTitle.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            episodesButton.topAnchor.constraint(equalTo: locationsButton.bottomAnchor, constant: 30),
            episodesButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            episodesButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            episodesButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.22),
            episodesButtonTitle.topAnchor.constraint(equalTo: locationsButtonTitle.bottomAnchor, constant: 30),
            episodesButtonTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            episodesButtonTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            episodesButtonTitle.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.22)
        ])

    }
    
    @objc func tapCharactersButton() {
        
        navigationController?.pushViewController(CharactersVC(), animated: true)
    }
    
    @objc func tapLocationsButton() {
        navigationController?.pushViewController(LocationVC(), animated: true)
    }

    @objc func tapEpisodesButton() {
        print("Episodes to show")
        navigationController?.pushViewController(EpisodeVC(), animated: true)
    }
    
    private func setupNavBar() {
        
        title = "Chose section"
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
}




//class SecondController: ViewController {
//
//    override func setupSubviews() {
//        super.setupSubviews()
//        view.backgroundColor = .gray
//        titleLabel.text = "Second Controller"
//        nextButton.setTitle("PRESENT", for: .normal)
//        title = "Second Controller"
//    }
//
//    override func tapNextButton() {
//        print("Leaving Second Controller")
//        let vc = ThirdController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//}
//
//class ThirdController: ViewController {
//
//    override func setupSubviews() {
//        super.setupSubviews()
//
//        view.backgroundColor = .systemGreen
//        titleLabel.text = "Third Controller"
//        nextButton.setTitle("Pop to root", for: .normal)
//        title = "Third Controller"
//    }
//
//    override func tapNextButton() {
//        print("Leaving Third Controller")
//        navigationController?.popToRootViewController(animated: true)
//    }
//
