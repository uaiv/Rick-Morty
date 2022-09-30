//
//  LocationsVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 03/06/2022.
//

import UIKit
import SnapKit

final class LocationsVC: UIViewController {
    
    private var locationObject: LocationResponseObject?
    private var locationCollectionView: UICollectionView?
    private var locationCollectionData: [LocationResultsModel] = []
    private var str: String?
    private var searchController = UISearchController()
    private var pageNumber = 1
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        getData()
        setupNavbar()
    }
    
}

private extension LocationsVC {

    private func setupNavbar() {
        
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
        
        title = "Locations p.\(pageNumber)"
        
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
        guard let next = locationObject?.info.next else { return }
        str = next
        pageNumber += 1
        title = "Locations p.\(pageNumber)"
        getData()
    }

    @objc private func tapPrevButton() {
        if let prev = locationObject?.info.prev {
        str = prev
            pageNumber -= 1
        title = "Locations p.\(pageNumber)"
        getData()
        } else {
        navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

extension LocationsVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            getData()
        } else {
            locationCollectionData = locationCollectionData.filter { $0.name.contains((searchText)) }
            locationCollectionView?.reloadData()
        }
    }
    
}

private extension LocationsVC {
    
    private func setupSubviews() {
    
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 1.05,
                                               height: 50)
        collectionViewLayout.scrollDirection = .vertical

        locationCollectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionViewLayout)
        locationCollectionView?.backgroundColor = .gray

        guard let locationCollectionView = locationCollectionView else { return }
        view.addSubview(locationCollectionView)
        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
        locationCollectionView.register(LocationCell.self, forCellWithReuseIdentifier: "locationCell")
        locationCollectionView.snp.makeConstraints{ maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
}

extension LocationsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ locationCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationCollectionData.count
    }
    
    func collectionView(_ locationCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = locationCollectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath)
        (cell as? LocationCell)?.setData(with: locationCollectionData[indexPath.row])
        return cell
    }
    
    func collectionView(_ locationCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = LocationInfoVC()
        vc.locationObject = locationCollectionData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
                                  
                                   
private extension LocationsVC {
    
    private func getData() {
        Request.Location.fire(url: str) { locationObject in
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


