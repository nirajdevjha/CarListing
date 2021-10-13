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

    private lazy var listingFloatingView: FloatingButtonView = {
        let view = FloatingButtonView().disableAutoResize()
        return view
    }()

    private lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero).disableAutoResize()
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mapView.delegate = self
        setupViews()
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        view.addSubview(mapView)
        view.addSubview(listingFloatingView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            listingFloatingView.widthAnchor.constraint(equalToConstant: 40),
            listingFloatingView.heightAnchor.constraint(equalTo: listingFloatingView.widthAnchor),
            listingFloatingView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            listingFloatingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        listingFloatingView.cornerRadius = 20
        listingFloatingView.addShadow()
        floatingButtonEvent()
    }

    private func addSelectedCarView(data: SelectedCarViewData) {
        removeExistingSelectedCarViewIfAny()
        let selectedCarView = SelectedCarView().disableAutoResize()
        view.addSubview(selectedCarView)
        selectedCarView.sizeToFit()
        NSLayoutConstraint.activate([
            selectedCarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            selectedCarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            selectedCarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        selectedCarView.configureView(delegate: self, model: data)
    }

    private func removeExistingSelectedCarViewIfAny() {
        if let existingView = view.viewWithTag(999) {
            existingView.removeFromSuperview()
        }
    }

    private func floatingButtonEvent() {
        listingFloatingView.onFloatingButtonTap = { [weak self] in
            guard let self = self else { return }
            self.presenter?.openCarListing()
        }
    }
}

extension MapListViewController: SelectedCarViewDelegate {
    func selectedCarViewDismissed() {
        mapView.selectedAnnotations.forEach({ mapView.deselectAnnotation($0, animated: false) })
    }
}

extension MapListViewController: MapListViewProtocol {
    func showListingFloatingButton(isHidden: Bool) {
        DispatchQueue.dispatchToMainThreadIfRequired {
            self.listingFloatingView.isHidden = isHidden
        }
    }

    func setInitialLocationOnMap(initialLocation: CLLocation, regionRadius: CLLocationDistance) {
        mapView.setInitialLocation(with: initialLocation, regionRadius: regionRadius)
    }

    func markCarsOnMap(carLocations: [CarAnnotaion]) {
        DispatchQueue.main.async {
            for carLocation in carLocations {
                self.mapView.addAnnotation(carLocation)
            }
        }
    }
}

extension MapListViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "carMarker")
        annotationView.glyphImage = UIImage(asset: .carMarker)
        annotationView.markerTintColor = .black
        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let carAnnotation = view.annotation as? CarAnnotaion,
              let data = presenter?.getSelectedCarData(carAnnotation: carAnnotation) else {
            return
        }
        addSelectedCarView(data: data)
    }
}
