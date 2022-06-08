//
//  Locations VC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 03/06/2022.
//

import UIKit

final class LocationVC: UIViewController {
    
    private var locationObject: LocationResponseObject?
    private var locationCollectionView: UICollectionView?
    private var locationCollectionData: [LocationResultsModel] = []
    private var locationstr: String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        getData()
        setupNavbar()

    }
    
}


private extension LocationVC {

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
        
        title = "Locations"
        
        let navBar = UINavigationBar()
        navBar.prefersLargeTitles = false
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.leftBarButtonItem = prevButton
        navigationItem.rightBarButtonItem = nextButton

    }

    @objc private func tapNextButton() {
        guard let next = locationObject?.info.next else { return }
        locationstr = next
        getData()
    }

    @objc private func tapPrevButton() {
        
        if let prev = locationObject?.info.prev {
        locationstr = prev
        getData()
        } else {
            navigationItem.leftBarButtonItem?.title = "Back"
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

private extension LocationVC {
    
    private func setupSubviews() {
    
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 1,
                                               height: UIScreen.main.bounds.width / 2)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 2
        collectionViewLayout.minimumInteritemSpacing = 1

        locationCollectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionViewLayout)
        locationCollectionView?.backgroundColor = .cyan

        guard let locationCollectionView = locationCollectionView else { return }
        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
        locationCollectionView.isPagingEnabled = true
        locationCollectionView.register(LocationCell.self, forCellWithReuseIdentifier: "LocationCell")
        view.addSubview(locationCollectionView)

        locationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            locationCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            locationCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            locationCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension LocationVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ locationCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationCollectionData.count
    }
    
    func collectionView(_ locationCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = locationCollectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath)
        (cell as? LocationCell)?.setData(with: locationCollectionData[indexPath.row])
        return cell
    }
    
    func LocationCollectionView(_ locationCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let locationCollectionObject = locationCollectionData[indexPath.row]
        
        
        let locationPassedName = locationCollectionObject.name
        let locationPassedType = locationCollectionObject.type
        let locationPassedDimension = locationCollectionObject.dimension
        let locationPassedResidents = locationCollectionObject.residents
        let locationPassedUrl = locationCollectionObject.url
        
        let locationPassedObject: (name: String, type: String, dimension: String, residents: [String], url: String) = (locationPassedName, locationPassedType, locationPassedDimension, locationPassedResidents, locationPassedUrl)
        let vc = LocationInfoVC(with: locationPassedObject)
        navigationController?.pushViewController(vc, animated: true)
    
        
    }
    
}
                                  
                                   
private extension LocationVC {
    
    private func getData() {
        Request.Location.fire(url: locationstr) { locationObject in
            self.locationObject = locationObject
            DispatchQueue.main.async {
                self.populateData()
            }
        }
    }
    
    private func populateData() {
        guard let locationResults = locationObject?.results else { return }
        locationCollectionData = locationResults
        locationCollectionView?.reloadData()
    }
    
}


