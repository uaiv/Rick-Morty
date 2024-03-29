//
//  SectionsVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 31/05/2022.
//

import UIKit
import SnapKit


final class SectionsVC: UIViewController {
    
    private let charactersButton = UIButton()
    private let locationsButton = UIButton()
    private let episodesButton = UIButton()
    private let charactersButtonTitle = UILabel()
    private let locationsButtonTitle = UILabel()
    private let episodesButtonTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupNavBar()
    }
    
    func setupSubviews() {
        
        view.addSubview(charactersButton)
        charactersButton.clipsToBounds = true
        charactersButton.contentMode = .scaleAspectFill
        charactersButton.setImage(UIImage(named: "3.png"), for: .normal)
        charactersButton.layer.cornerRadius = 25
        charactersButton.addTarget(self, action: #selector(tapCharactersButton), for: .touchUpInside)
        charactersButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(140)
            maker.trailing.leading.equalToSuperview().inset(20)
            maker.height.equalTo(UIScreen.main.bounds.height * 0.22)
        }
        
        view.addSubview(charactersButtonTitle)
        charactersButtonTitle.backgroundColor = .white
        charactersButtonTitle.layer.opacity = 0.75
        charactersButtonTitle.clipsToBounds = true
        charactersButtonTitle.contentMode = .scaleAspectFill
        charactersButtonTitle.text = "Characters"
        charactersButtonTitle.textColor = .black
        charactersButtonTitle.textAlignment = .center
        charactersButtonTitle.font = .boldSystemFont(ofSize: 35.0)
        charactersButtonTitle.layer.cornerRadius = 25
        charactersButtonTitle.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(140)
            maker.trailing.leading.equalToSuperview().inset(20)
            maker.height.equalTo(UIScreen.main.bounds.height * 0.22)
        }
                
        view.addSubview(locationsButton)
        locationsButton.clipsToBounds = true
        locationsButton.contentMode = .scaleAspectFill
        locationsButton.layer.cornerRadius = 25
        locationsButton.setImage(UIImage(named: "4.png"), for: .normal)
        locationsButton.addTarget(self, action: #selector(tapLocationsButton), for: .touchUpInside)
        locationsButton.snp.makeConstraints { maker in
            maker.top.equalTo(charactersButton.snp.bottom).offset(30)
            maker.trailing.leading.equalToSuperview().inset(20)
            maker.height.equalTo(UIScreen.main.bounds.height * 0.22)
        }

        view.addSubview(locationsButtonTitle)
        locationsButtonTitle.backgroundColor = .white
        locationsButtonTitle.layer.opacity = 0.75
        locationsButtonTitle.clipsToBounds = true
        locationsButtonTitle.contentMode = .scaleAspectFill
        locationsButtonTitle.text = "Locations"

        locationsButtonTitle.textColor = .black
        locationsButtonTitle.textAlignment = .center
        locationsButtonTitle.font = .boldSystemFont(ofSize: 35.0)
        locationsButtonTitle.layer.cornerRadius = 25
        locationsButtonTitle.snp.makeConstraints { maker in
            maker.top.equalTo(charactersButton.snp.bottom).offset(30)
            maker.trailing.leading.equalToSuperview().inset(20)
            maker.height.equalTo(UIScreen.main.bounds.height * 0.22)
        }

        view.addSubview(episodesButton)
        episodesButton.clipsToBounds = true
        episodesButton.contentMode = .scaleAspectFill
        episodesButton.layer.cornerRadius = 25
        episodesButton.setImage(UIImage(named: "5.png"), for: .normal)
        episodesButton.addTarget(self, action: #selector(tapEpisodesButton), for: .touchUpInside)
        episodesButton.snp.makeConstraints { maker in
            maker.top.equalTo(locationsButton.snp.bottom).offset(30)
            maker.trailing.leading.equalToSuperview().inset(20)
            maker.height.equalTo(UIScreen.main.bounds.height * 0.22)
        }

        view.addSubview(episodesButtonTitle)
        episodesButtonTitle.backgroundColor = .white
        episodesButtonTitle.layer.opacity = 0.75
        episodesButtonTitle.clipsToBounds = true
        episodesButtonTitle.contentMode = .scaleAspectFill
        episodesButtonTitle.text = "Episodes"
        episodesButtonTitle.textColor = .black
        episodesButtonTitle.textAlignment = .center
        episodesButtonTitle.font = .boldSystemFont(ofSize: 35.0)
        episodesButtonTitle.layer.cornerRadius = 25
        episodesButtonTitle.snp.makeConstraints { maker in
            maker.top.equalTo(locationsButtonTitle.snp.bottom).offset(30)
            maker.trailing.leading.equalToSuperview().inset(20)
            maker.height.equalTo(UIScreen.main.bounds.height * 0.22)
        }

    }
    
    @objc func tapCharactersButton() {
        navigationController?.pushViewController(CharactersVC(), animated: true)
    }
    
    @objc func tapLocationsButton() {
        navigationController?.pushViewController(LocationsVC(), animated: true)
    }

    @objc func tapEpisodesButton() {
        navigationController?.pushViewController(EpisodesVC(), animated: true)
    }
    
    private func setupNavBar() {
        title = "Choose section"
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
}

