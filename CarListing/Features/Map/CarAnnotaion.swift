//
//  CarInfo.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 12/10/21.
//

import Foundation
import MapKit

class CarAnnotaion: NSObject, MKAnnotation {
    let id: String
    var title: String?
    var coordinate: CLLocationCoordinate2D

    init(id: String, title: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.title = title
        self.coordinate = coordinate
    }
}
