//
//  EpisodesVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit

final class EpisodeVC: UIViewController {
    
    private var episodeObject: EpisodeResponseObject?
    private var episodeCollectionView: UICollectionView?
    private var episodeCollectionData: [EpisodeResultsModel] = []
    private var episodestr: String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        getData()
        setupNavbar()

    }
    
}


private extension EpisodeVC {

    private func setupNavbar() {
        
        let nextButton = UIBarButtonItem(
            title: ">",
            style: .plain,
            target: self,
            action: #selector(tapNextButton)
        )
        
        let prevButton = UIBarButtonItem(
            title: "<",
            style: .plain,
            target: self,
            action: #selector(tapPrevButton)
            
        )
        
        title = "Episodes"
        
        let navBar = UINavigationBar()
        navBar.prefersLargeTitles = false
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.leftBarButtonItem = prevButton
        navigationItem.rightBarButtonItem = nextButton

    }

    @objc private func tapNextButton() {
        guard let next = episodeObject?.info.next else { return }
        episodestr = next
        getData()
    }

    @objc private func tapPrevButton() {
        
        if let prev = episodeObject?.info.prev {
        episodestr = prev
        getData()
        } else {
            navigationItem.leftBarButtonItem?.title = "Back"
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

private extension EpisodeVC {
    
    private func setupSubviews() {
    
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 1,
                                               height: UIScreen.main.bounds.width / 2)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 2
        collectionViewLayout.minimumInteritemSpacing = 1

        episodeCollectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionViewLayout)
        episodeCollectionView?.backgroundColor = .cyan

        guard let episodeCollectionView = episodeCollectionView else { return }
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        episodeCollectionView.isPagingEnabled = true
        episodeCollectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: "EpisodeCell")
        view.addSubview(episodeCollectionView)

        episodeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodeCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            episodeCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension EpisodeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ episodeCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodeCollectionData.count
    }
    
    func collectionView(_ episodeCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = episodeCollectionView.dequeueReusableCell(withReuseIdentifier: "EpisodeCell", for: indexPath)
        (cell as? EpisodeCell)?.setData(with: episodeCollectionData[indexPath.row])
        return cell
    }
    
    func EpisodeCollectionView(_ locationCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let episodeCollectionObject = episodeCollectionData[indexPath.row]
        
        
        let episodePassedName = episodeCollectionObject.name
        let episodePassedAirdate = episodeCollectionObject.air_date
        let episodePassedEpisode = episodeCollectionObject.episode
        let episodePassedCharacters = episodeCollectionObject.characters
        let episodePassedUrl = episodeCollectionObject.url
        
        let episodePassedObject: (name: String, air_date: String, episode: String, characters: [String], url: String) = (episodePassedName, episodePassedAirdate, episodePassedEpisode, episodePassedCharacters, episodePassedUrl)
        let vc = EpisodeInfoVC(with: episodePassedObject)
        navigationController?.pushViewController(vc, animated: true)
    
        
    }
    
}
                                  
                                   
private extension EpisodeVC {
    
    private func getData() {
        Request.Episode.fire(url: episodestr) { episodeObject in
            self.episodeObject = episodeObject
            DispatchQueue.main.async {
                self.populateData()
            }
        }
    }
    
    private func populateData() {
        guard let episodeResults = episodeObject?.results else { return }
        episodeCollectionData = episodeResults
        episodeCollectionView?.reloadData()
    }
    
}


