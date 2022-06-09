//
//  EpisodesVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit

final class EpisodesVC: UIViewController {
    
    private var episodeObject: EpisodeResponseObject?
    private var episodeCollectionView: UICollectionView?
    private var episodeCollectionData: [EpisodeResultsModel] = []
    private var str: String?
    private var searchController = UISearchController()
    private var pgnr = 1
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
}

private extension EpisodesVC {

    private func setupNavBar() {
        
        let nextButton = UIBarButtonItem(
            title: "Next",
            style: .plain,
            target: self,
            action: #selector(tapNextButton)
        )
        
        let prevButton = UIBarButtonItem(
            title: "Prev",
            style: .plain,
            target: self,
            action: #selector(tapPrevButton)
        )
        
        title = "Episodes p.\(pgnr)"
        
        let navBar = UINavigationBar()
        navBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.leftBarButtonItem = prevButton
        navigationItem.rightBarButtonItem = nextButton
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false

    }

    @objc private func tapNextButton() {
        guard let next = episodeObject?.info.next else { return }
        str = next
        pgnr += 1
        title = "Episodes p.\(pgnr)"
        getData()
    }

    @objc private func tapPrevButton() {
        
        if let prev = episodeObject?.info.prev {
        str = prev
        pgnr -= 1
        title = "Episodes p.\(pgnr)"
        getData()
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension EpisodesVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            getData()
        } else {
            episodeCollectionData = episodeCollectionData.filter { $0.name.contains((searchText)) }
            episodeCollectionView?.reloadData()
        }
    }
    
}

private extension EpisodesVC {
    
    private func setupSubviews() {
    
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 1.05,
                                               height: 50)
        collectionViewLayout.scrollDirection = .vertical

        episodeCollectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionViewLayout)
        episodeCollectionView?.backgroundColor = .darkGray

        guard let episodeCollectionView = episodeCollectionView else { return }
        view.addSubview(episodeCollectionView)
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        episodeCollectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: "episodeCell")

        episodeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            episodeCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension EpisodesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ episodeCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodeCollectionData.count
    }
    
    func collectionView(_ episodeCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = episodeCollectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath)
        (cell as? EpisodeCell)?.setData(with: episodeCollectionData[indexPath.row])
        return cell
    }
    
    func collectionView(_ episodeCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = EpisodeInfoVC()
        vc.episodeObject = episodeCollectionData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
                                  
private extension EpisodesVC {
    
    private func getData() {
        Request.Episode.fire(url: str) { episodeObject in
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
