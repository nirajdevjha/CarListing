//
//  MapListViewController.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit
import MapKit

class MapListViewController: UIViewController {
    var presenter: MapListPresenterProtocol?

    private let listingFloatingButton: UIButton = {
        let button = UIButton().disableAutoResize()
        button.addTarget(self, action: #selector(didTapListingFloatingButton), for: .touchUpInside)
        button.setTitle("List", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    private let mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero).disableAutoResize()
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        view.addSubview(mapView)
        view.addSubview(listingFloatingButton)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            listingFloatingButton.widthAnchor.constraint(equalToConstant: 50),
            listingFloatingButton.heightAnchor.constraint(equalTo: listingFloatingButton.widthAnchor),
            listingFloatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            listingFloatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    @objc
    private func didTapListingFloatingButton() {
        presenter?.openCarListing()
    }
}

extension MapListViewController: MapListViewProtocol {
    func setInitialLocationOnMap(initialLocation: CLLocation, regionRadius: CLLocationDistance) {
        mapView.setInitialLocation(with: initialLocation, regionRadius: regionRadius)
    }

    func markCarsOnMap(carLocations: [CarAnnotaion]) {
        for carLocation in carLocations {
            mapView.addAnnotation(carLocation)
        }
    }
}
