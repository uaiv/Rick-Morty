//
//  LocationsInfoVC.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 07/06/2022.
//

import UIKit

class LocationInfoVC: UIViewController {
      
     var locationObject: LocationResultsModel?
    
    
    
//    (name: String, type: String, dimension: String,
//                         residents: [String], url: String)?
//    init(with locationObject: (name: String, type: String, dimension: String,
//                       residents: [String], url: String)) {
//        super.init(nibName: nil, bundle: nil)
//        self.locationObject = locationObject
//    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        locationObject = nil
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private let locationContainerView = UIView()
    private let locationNameLabel = UILabel()
    private let locationTypeLabel = UILabel()
    private let locationDimensionLabel = UILabel()
//    private let locationResidentsLabel = UILabel()
//    private let locationUrlLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    
}
}

private extension LocationInfoVC {
    
    private func setupSubviews() {
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationController?.navigationBar.title = object?.name ?? ""
//        navigationController?.navigationBar.prefersLargeTitles = true
//        title = object?.name ?? ""
        
        view.addSubview(locationContainerView)
        locationContainerView.backgroundColor = .systemPink
        locationContainerView.translatesAutoresizingMaskIntoConstraints = false
        
//        containerView.addSubview(titleLabel)
//        titleLabel.textColor = .systemGreen
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.text = object?.name ?? ""
        
//        locationContainerView.addSubview(locationImageView)
//        locationImageView.layer.cornerRadius = 30
//        locationImageView.clipsToBounds = true
//        locationImageView.translatesAutoresizingMaskIntoConstraints = false
//        locationImageView.downloadImageFrom(urlString: object?.image ?? "", imageMode: .scaleAspectFill)
        
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
        
//        locationContainerView.addSubview(locationResidentsLabel)
//        locationResidentsLabel.textColor = .white
//        locationResidentsLabel.translatesAutoresizingMaskIntoConstraints = false
//        locationResidentsLabel.text = "Residents:   " + (locationObject?.residents.reduce("", +) ?? "")
        
//        locationContainerView.addSubview(locationUrlLabel)
//        locationUrlLabel.textColor = .white
//        locationUrlLabel.translatesAutoresizingMaskIntoConstraints = false
//        locationUrlLabel.text = "Url:   " + (locationObject?.url ?? "")
        
        NSLayoutConstraint.activate([
            locationContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            locationContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            locationContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            locationContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationNameLabel.topAnchor.constraint(equalTo: locationContainerView.topAnchor, constant: 140),
            locationNameLabel.centerXAnchor.constraint(equalTo: locationContainerView.centerXAnchor),
            locationNameLabel.widthAnchor.constraint(equalTo: locationContainerView.widthAnchor, multiplier: 0.8),
            locationNameLabel.heightAnchor.constraint(equalTo: locationContainerView.widthAnchor, multiplier: 0.8),
            
            locationTypeLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor, constant: 30),
            locationTypeLabel.leftAnchor.constraint(equalTo: locationNameLabel.leftAnchor),
            locationTypeLabel.rightAnchor.constraint(equalTo: locationNameLabel.rightAnchor, constant: -5),
            
            locationDimensionLabel.topAnchor.constraint(equalTo: locationTypeLabel.bottomAnchor, constant: 5),
            locationDimensionLabel.leftAnchor.constraint(equalTo: locationTypeLabel.leftAnchor),
            locationDimensionLabel.rightAnchor.constraint(equalTo: locationTypeLabel.rightAnchor, constant: -5),
            
//            locationResidentsLabel.topAnchor.constraint(equalTo: locationDimensionLabel.bottomAnchor, constant: 5),
//            locationResidentsLabel.leftAnchor.constraint(equalTo: locationDimensionLabel.leftAnchor),
//            locationResidentsLabel.rightAnchor.constraint(equalTo: locationDimensionLabel.rightAnchor, constant: -5),
//
//            locationUrlLabel.topAnchor.constraint(equalTo: locationResidentsLabel.bottomAnchor, constant: 5),
//            locationUrlLabel.leftAnchor.constraint(equalTo: locationResidentsLabel.leftAnchor),
//            locationUrlLabel.rightAnchor.constraint(equalTo: locationResidentsLabel.rightAnchor, constant: -5)
        ])
    }
}
    

