//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 10/05/2022.
//

import UIKit

final class CharactersVC: UIViewController {
    
     private var characterObject: CharacterResponsObject?
     private var collectionView: UICollectionView?
     private var collectionData: [ResultsModel] = []
     private var str: String?
     private var searchController = UISearchController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        getData()
//        searchCharacter()


    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            setupNavbar()
        }
    
}

private extension CharactersVC {
    
    private func setupSubviews() {
    
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 1,
                                               height: UIScreen.main.bounds.width / 2)
//        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 2
        collectionViewLayout.minimumInteritemSpacing = 1

        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionViewLayout)
        collectionView?.backgroundColor = .cyan

        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "CharacterCell")
        

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

private extension CharactersVC {
    
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
        
        title = "Characters"
        
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
        getData()
    }

    @objc private func tapPrevButton() {
        
        if let prev = characterObject?.info.prev {
        str = prev
        getData()
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
//        @objc func tapBackButton() {
//
//            navigationController?.popToRootViewController(animated: true)
//        }
    }
    
extension CharactersVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            getData()
        } else {
            collectionData = collectionData.filter { $0.name.contains((searchText)) }
            collectionView?.reloadData()
        }
        
    }
    
    
}

extension CharactersVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        collectionData = results
        collectionView?.reloadData()
    }
    
}

//private extension CharactersVC {
//
//    private func searchCharacter() {
//
//        title = "Search"
//        searchController.searchResultsUpdater = self
//        navigationItem.searchController = searchController
//
//        func updateSearchResults(for searchController: UISearchController) {
//            guard let text = searchController.searchBar.text else {
//        }
//        print(text)
//    }
//
//}
//}

//private extension CharactersVC {
//
//        private func createCharacterFilter(name: String?, status: String?, species: String?, type: String?, gender: String?) -> RMCharacterFilter {
//
//            let parameterDict: [String: String] = [
//                "name" : name ?? "",
//                "status" : status ?? "",
//                "species" : species ?? "",
//                "type" : type ?? "",
//                "gender" : gender ?? ""
//            ]
//
//            var query = "character/?"
//            for (key, value) in parameterDict {
//                if value != "" {
//                    query.append(key+"="+value+"&")
//                }
//            }
//
//            let filter = RMCharacterFilter(name: parameterDict["name"]!, status: parameterDict["status"]!, species: parameterDict["species"]!, type: parameterDict["type"]!, gender: parameterDict["gender"]!, query: query)
//            return filter
//        }
//
//    public struct RMCharacterFilter {
//        public let name: String
//        public let status: String
//        public let species: String
//        public let type: String
//        public let gender: String
//        public let query: String
//    }
//
//    }




