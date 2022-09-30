//
//  LocationsInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 03/06/2022.
//

import UIKit
import SnapKit

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
        title = locationObject?.name ?? ""
        locationContainerView.snp.makeConstraints{ maker in
            maker.top.bottom.leading.trailing.equalToSuperview()
        }
        
        locationContainerView.addSubview(locationNameLabel)
        locationNameLabel.textColor = .white
        locationNameLabel.text = "Name:   " + (locationObject?.name ?? "")
        locationNameLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(locationContainerView.snp.top).offset(140)
            maker.leading.equalTo(locationContainerView.snp.leading).offset(10)
        }
        
        locationContainerView.addSubview(locationTypeLabel)
        locationTypeLabel.textColor = .white
        locationTypeLabel.text = "Type:   " + (locationObject?.type ?? "")
        locationTypeLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(locationNameLabel.snp.bottom).offset(10)
            maker.leading.equalTo(locationContainerView.snp.leading).offset(10)
        }
        
        locationContainerView.addSubview(locationDimensionLabel)
        locationDimensionLabel.textColor = .white
        locationDimensionLabel.text = "Dimension:   " + (locationObject?.dimension ?? "")
        locationDimensionLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(locationTypeLabel.snp.bottom).offset(10)
            maker.leading.equalTo(locationContainerView.snp.leading).offset(10)
        }
        
        locationContainerView.addSubview(locationResidentsLabel)
        locationResidentsLabel.textColor = .white
        locationResidentsLabel.text = "Residents:   " + (locationObject?.residents.reduce("", +) ?? "")
        locationResidentsLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(locationDimensionLabel.snp.bottom).offset(10)
            maker.leading.equalTo(locationContainerView.snp.leading).offset(10)
        }
        
    }
    
}


