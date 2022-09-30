//
//  EpisodesInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit
import SnapKit

class EpisodeInfoVC: UIViewController {
    
    var episodeObject: EpisodeResultsModel?
    
    private let episodeContainerView = UIView()
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
        title = episodeObject?.name ?? ""
        episodeContainerView.snp.makeConstraints{ maker in
            maker.top.leading.trailing.equalToSuperview()
        }
        
        episodeContainerView.addSubview(episodeNameLabel)
        episodeNameLabel.textColor = .white
        episodeNameLabel.text = "Name:   " + (episodeObject?.name ?? "")
        episodeNameLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(episodeContainerView.snp.top).offset(140)
            maker.leading.equalTo(episodeContainerView.snp.leading).offset(10)
        }
        
        episodeContainerView.addSubview(episodeAirdateLabel)
        episodeAirdateLabel.textColor = .white
        episodeAirdateLabel.text = "Air date:   " + (episodeObject?.air_date ?? "")
        episodeAirdateLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(episodeNameLabel.snp.bottom).offset(10)
            maker.leading.equalTo(episodeContainerView.snp.leading).offset(10)
        }
        
        episodeContainerView.addSubview(episodeEpisodeLabel)
        episodeEpisodeLabel.textColor = .white
        episodeEpisodeLabel.text = "Episode:   " + (episodeObject?.episode ?? "")
        episodeEpisodeLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(episodeAirdateLabel.snp.bottom).offset(10)
            maker.leading.equalTo(episodeContainerView.snp.leading).offset(10)
        }
        
        episodeContainerView.addSubview(episodeCharactersLabel)
        episodeCharactersLabel.textColor = .white
        episodeCharactersLabel.text = "Characters:   " + (episodeObject?.characters.reduce("", +) ?? "")
        episodeCharactersLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(episodeEpisodeLabel.snp.bottom).offset(10)
            maker.leading.equalTo(episodeContainerView.snp.leading).offset(10)
        }
        
    }
    
}


