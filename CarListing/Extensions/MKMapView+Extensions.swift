//
//  MKMapView+Extensions.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 12/10/21.
//

import MapKit

extension MKMapView {
    func setInitialLocation(
        with location: CLLocation,
        regionRadius: CLLocationDistance
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        setRegion(coordinateRegion, animated: true)
    }
}
