//
//  EpisodeInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit

class EpisodeInfoVC: UIViewController {
      
    private var episodeObject: (name: String, air_date: String, episode: String,
                         characters: [String], url: String)?
    init(with episodeObject: (name: String, air_date: String, episode: String,
                              characters: [String], url: String)) {
        super.init(nibName: nil, bundle: nil)
        self.episodeObject = episodeObject
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        episodeObject = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let episodeContainerView = UIView()
    private let episodeTitleLabel = UILabel()
//    private let episodeImageView = ImageView()
    private let episodeNameLabel = UILabel()
    private let episodeAirdateLabel = UILabel()
    private let episodeEpisodeLabel = UILabel()
    private let episodeCharactersLabel = UILabel()
    private let episodeUrlLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    
}
}

private extension EpisodeInfoVC {
    
    private func setupSubviews() {
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationController?.navigationBar.title = object?.name ?? ""
        navigationController?.navigationBar.prefersLargeTitles = true
//        title = object?.name ?? ""
        
        view.addSubview(episodeContainerView)
        episodeContainerView.backgroundColor = .systemPink
        episodeContainerView.translatesAutoresizingMaskIntoConstraints = false
        
//        containerView.addSubview(titleLabel)
//        titleLabel.textColor = .systemGreen
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.text = object?.name ?? ""
        
//        locationContainerView.addSubview(locationImageView)
//        locationImageView.layer.cornerRadius = 30
//        locationImageView.clipsToBounds = true
//        locationImageView.translatesAutoresizingMaskIntoConstraints = false
//        locationImageView.downloadImageFrom(urlString: object?.image ?? "", imageMode: .scaleAspectFill)
        
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
        
        episodeContainerView.addSubview(episodeUrlLabel)
        episodeUrlLabel.textColor = .white
        episodeUrlLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeUrlLabel.text = "Url:   " + (episodeObject?.url ?? "")
        
        NSLayoutConstraint.activate([
            episodeContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            episodeContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            episodeContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            episodeNameLabel.topAnchor.constraint(equalTo: episodeContainerView.topAnchor, constant: 140),
            episodeNameLabel.centerXAnchor.constraint(equalTo: episodeContainerView.centerXAnchor),
            episodeNameLabel.widthAnchor.constraint(equalTo: episodeContainerView.widthAnchor, multiplier: 0.8),
            episodeNameLabel.heightAnchor.constraint(equalTo: episodeContainerView.widthAnchor, multiplier: 0.8),
            
            episodeAirdateLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 30),
            episodeAirdateLabel.leftAnchor.constraint(equalTo: episodeNameLabel.leftAnchor),
            episodeAirdateLabel.rightAnchor.constraint(equalTo: episodeNameLabel.rightAnchor, constant: -5),
            
            episodeEpisodeLabel.topAnchor.constraint(equalTo: episodeAirdateLabel.bottomAnchor, constant: 5),
            episodeEpisodeLabel.leftAnchor.constraint(equalTo: episodeAirdateLabel.leftAnchor),
            episodeEpisodeLabel.rightAnchor.constraint(equalTo: episodeAirdateLabel.rightAnchor, constant: -5),
            
            episodeCharactersLabel.topAnchor.constraint(equalTo: episodeEpisodeLabel.bottomAnchor, constant: 5),
            episodeCharactersLabel.leftAnchor.constraint(equalTo: episodeEpisodeLabel.leftAnchor),
            episodeCharactersLabel.rightAnchor.constraint(equalTo: episodeEpisodeLabel.rightAnchor, constant: -5),
            
            episodeUrlLabel.topAnchor.constraint(equalTo: episodeCharactersLabel.bottomAnchor, constant: 5),
            episodeUrlLabel.leftAnchor.constraint(equalTo: episodeCharactersLabel.leftAnchor),
            episodeUrlLabel.rightAnchor.constraint(equalTo: episodeCharactersLabel.rightAnchor, constant: -5)
        ])
    }
}
    

