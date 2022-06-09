//
//  CharactersVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import UIKit

final class CharactersVC: UIViewController {
    
    private var characterObject: CharacterResponseObject?
    private var characterCollectionView: UICollectionView?
    private var characterCollectionData: [CharacterResultsModel] = []
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

extension CharactersVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            getData()
        } else {
            characterCollectionData = characterCollectionData.filter { $0.name.contains((searchText)) }
            characterCollectionView?.reloadData()
        }
    }
    
}

private extension CharactersVC {
    
    private func setupSubviews() {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.05,
                                               height: UIScreen.main.bounds.width / 2)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 1
        collectionViewLayout.minimumInteritemSpacing = 1
        
        characterCollectionView = UICollectionView(frame: .zero,
                                                   collectionViewLayout: collectionViewLayout)
        characterCollectionView?.backgroundColor = .darkGray
        
        guard let characterCollectionView = characterCollectionView else { return }
        view.addSubview(characterCollectionView)
        characterCollectionView.delegate = self
        characterCollectionView.dataSource = self
        characterCollectionView.isPagingEnabled = true
        characterCollectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "characterCell")
        characterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            characterCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

private extension CharactersVC {
    
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
        
        
        title = "Characters p.\(pgnr)"
        
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
        guard let next = characterObject?.info.next else { return }
        str = next
        pgnr += 1
        title = "Characters p.\(pgnr)"
        getData()
    }
    
    @objc private func tapPrevButton() {
        if let prev = characterObject?.info.prev {
            str = prev
            pgnr -= 1
            title = "Characters p.\(pgnr)"
            getData()
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

extension CharactersVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ characterCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterCollectionData.count
    }
    
    func collectionView(_ characterCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = characterCollectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath)
        (cell as? CharacterCell)?.setData(with: characterCollectionData[indexPath.row])
        return cell
    }
    
    func collectionView(_ characterCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharactersInfoVC()
        vc.characterObject = characterCollectionData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

private extension CharactersVC {
    
    private func getData() {
        Request.Character.fire(url: str) { characterObject in
            self.characterObject = characterObject
            DispatchQueue.main.async {
                self.populateData()
            }
        }
    }
    
    private func populateData() {
        guard let results = characterObject?.results else { return }
        characterCollectionData = results
        characterCollectionView?.reloadData()
    }
    
}
