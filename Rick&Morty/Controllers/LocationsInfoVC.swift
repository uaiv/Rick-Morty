//
//  LocationsInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 03/06/2022.
//

import UIKit

class LocationInfoVC: UIViewController {
    
    var locationObject: LocationResultsModel?
    
    private let locationContainerView = UIView()
    private let locationNameLabel = UILabel()
    private let locationTypeLabel = UILabel()
    private let locationDimensionLabel = UILabel()
    private let locationResidentsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        
    }
}

private extension LocationInfoVC {
    
    private func setupSubviews() {
        
        view.addSubview(locationContainerView)
        locationContainerView.translatesAutoresizingMaskIntoConstraints = false
        title = locationObject?.name ?? ""
        
        locationContainerView.addSubview(locationNameLabel)
        locationNameLabel.textColor = .white
        locationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationNameLabel.text = "Name:   " + (locationObject?.name ?? "")
        
        locationContainerView.addSubview(locationTypeLabel)
        locationTypeLabel.textColor = .white
        locationTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        locationTypeLabel.text = "Type:   " + (locationObject?.type ?? "")
        
        locationContainerView.addSubview(locationDimensionLabel)
        locationDimensionLabel.textColor = .white
        locationDimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        locationDimensionLabel.text = "Dimension:   " + (locationObject?.dimension ?? "")
        
        locationContainerView.addSubview(locationResidentsLabel)
        locationResidentsLabel.textColor = .white
        locationResidentsLabel.translatesAutoresizingMaskIntoConstraints = false
        locationResidentsLabel.text = "Residents:   " + (locationObject?.residents.reduce("", +) ?? "")
        
        NSLayoutConstraint.activate([
            locationContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            locationContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            locationContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            locationContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            locationNameLabel.topAnchor.constraint(equalTo: locationContainerView.topAnchor, constant: 140),
            locationNameLabel.leftAnchor.constraint(equalTo: locationContainerView.leftAnchor, constant: 10),
            locationNameLabel.rightAnchor.constraint(equalTo: locationContainerView.rightAnchor, constant: -5),
            
            locationTypeLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor, constant: 10),
            locationTypeLabel.leftAnchor.constraint(equalTo: locationContainerView.leftAnchor, constant: 10),
            locationTypeLabel.rightAnchor.constraint(equalTo: locationContainerView.rightAnchor, constant: -5),
            
            locationDimensionLabel.topAnchor.constraint(equalTo: locationTypeLabel.bottomAnchor, constant: 10),
            locationDimensionLabel.leftAnchor.constraint(equalTo: locationContainerView.leftAnchor, constant: 10),
            locationDimensionLabel.rightAnchor.constraint(equalTo: locationContainerView.rightAnchor, constant: -5),
            
            locationResidentsLabel.topAnchor.constraint(equalTo: locationDimensionLabel.bottomAnchor, constant: 10),
            locationResidentsLabel.leftAnchor.constraint(equalTo: locationContainerView.leftAnchor, constant: 10),
            locationResidentsLabel.rightAnchor.constraint(equalTo: locationContainerView.rightAnchor, constant: -5),
        ])
    }
    
}


