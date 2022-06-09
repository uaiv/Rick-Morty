//
//  EpisodesInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit

class EpisodeInfoVC: UIViewController {
    
    var episodeObject: EpisodeResultsModel?
    
    private let episodeContainerView = UIView()
    private let episodeTitleLabel = UILabel()
    private let episodeNameLabel = UILabel()
    private let episodeAirdateLabel = UILabel()
    private let episodeEpisodeLabel = UILabel()
    private let episodeCharactersLabel = UILabel()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
}

private extension EpisodeInfoVC {
    
    private func setupSubviews() {
        
        view.addSubview(episodeContainerView)
        episodeContainerView.translatesAutoresizingMaskIntoConstraints = false
        title = episodeObject?.name ?? ""
        
        episodeContainerView.addSubview(episodeNameLabel)
        episodeNameLabel.textColor = .white
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNameLabel.text = "Name:   " + (episodeObject?.name ?? "")
        
        episodeContainerView.addSubview(episodeAirdateLabel)
        episodeAirdateLabel.textColor = .white
        episodeAirdateLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeAirdateLabel.text = "Air date:   " + (episodeObject?.air_date ?? "")
        
        episodeContainerView.addSubview(episodeEpisodeLabel)
        episodeEpisodeLabel.textColor = .white
        episodeEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeEpisodeLabel.text = "Episode:   " + (episodeObject?.episode ?? "")
        
        episodeContainerView.addSubview(episodeCharactersLabel)
        episodeCharactersLabel.textColor = .white
        episodeCharactersLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeCharactersLabel.text = "Characters:   " + (episodeObject?.characters.reduce("", +) ?? "")
        
        NSLayoutConstraint.activate([
            episodeContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            episodeContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            episodeContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            episodeNameLabel.topAnchor.constraint(equalTo: episodeContainerView.topAnchor, constant: 140),
            episodeNameLabel.leftAnchor.constraint(equalTo: episodeContainerView.leftAnchor, constant: 10),
            episodeNameLabel.rightAnchor.constraint(equalTo: episodeContainerView.rightAnchor, constant: -5),
            
            episodeAirdateLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 10),
            episodeAirdateLabel.leftAnchor.constraint(equalTo: episodeContainerView.leftAnchor, constant: 10),
            episodeAirdateLabel.rightAnchor.constraint(equalTo: episodeContainerView.rightAnchor, constant: -5),
            
            episodeEpisodeLabel.topAnchor.constraint(equalTo: episodeAirdateLabel.bottomAnchor, constant: 10),
            episodeEpisodeLabel.leftAnchor.constraint(equalTo: episodeContainerView.leftAnchor, constant: 10),
            episodeEpisodeLabel.rightAnchor.constraint(equalTo: episodeContainerView.rightAnchor, constant: -5),
            
            episodeCharactersLabel.topAnchor.constraint(equalTo: episodeEpisodeLabel.bottomAnchor, constant: 10),
            episodeCharactersLabel.leftAnchor.constraint(equalTo: episodeContainerView.leftAnchor, constant: 10),
            episodeCharactersLabel.rightAnchor.constraint(equalTo: episodeContainerView.rightAnchor, constant: -5),
        ])
    }
}


