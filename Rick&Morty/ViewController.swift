//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 10/05/2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private var characterObject: CharacterResponsObject?
    private var collectionView: UICollectionView?
    private var collectionData: [ResultsModel] = []
    private var str: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        getData()
        setupNavbar()
    }
    
}

private extension ViewController {
    
    private func setupNavbar() {
        let navBar = navigationController?.navigationBar.self
        navBar?.prefersLargeTitles = true
        navBar?.barStyle = .black
        navBar?.backgroundColor = .darkGray
        navBar?.barTintColor = .darkGray
        navBar?.isTranslucent = false
        
        navBar?.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Prev",
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(tapPrevButton))
        navBar?.topItem?.leftBarButtonItem?.tintColor = .white
        navBar?.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Next",
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(tapNextButton))
        navBar?.topItem?.rightBarButtonItem?.tintColor = .white
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "Rick & Morty"
    }
    
    @objc private func tapNextButton() {
        guard let next = characterObject?.info.next else { return }
        str = next
        getData()
    }
    
    @objc private func tapPrevButton() {
        guard let prev = characterObject?.info.prev else { return }
        str = prev
        getData()
    }
}

private extension ViewController {
    
    private func setupSubviews() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 1,
                                               height: UIScreen.main.bounds.width / 2)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 2
        collectionViewLayout.minimumInteritemSpacing = 1
        
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionViewLayout)
        collectionView?.backgroundColor = .darkGray
        
        guard let collectionView = collectionView else { return }
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "CharacterCell")
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath)
        (cell as? CharacterCell)?.setData(with: collectionData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionObject = collectionData[indexPath.row]
        
        let passedImage = collectionObject.image
        let passedName = collectionObject.name
        let passedStatus = collectionObject.status
        let passedSpecies = collectionObject.species
        let passedGender = collectionObject.gender
        let passedOrigin = collectionObject.origin.name
        let passedLocation = collectionObject.location.name
        
        let passedObject: (image: String, name: String, status: String, species: String, gender: String, origin: String, location: String) = (passedImage, passedName, passedStatus, passedSpecies, passedGender, passedOrigin, passedLocation)
        let vc = InfoViewController(with: passedObject)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

private extension ViewController {
    
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
        collectionData = results
        collectionView?.reloadData()
    }
    
}

