//
//  MockMapListViewController.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import MapKit
import XCTest
@testable import CarListing

struct MockModel {
    var timesCalled: Int = 0
    var params: Any?
}

class MockMapListViewController: UIViewController, MapListViewProtocol {

    var isSetInitialLocation = MockModel()
    func setInitialLocationOnMap(initialLocation: CLLocation, regionRadius: CLLocationDistance) {
        isSetInitialLocation.timesCalled += 1
        isSetInitialLocation.params = [initialLocation, regionRadius]
    }

    var isMarkCars = MockModel()
    func markCarsOnMap(carLocations: [CarAnnotaion]) {
        isMarkCars.timesCalled += 1
        isMarkCars.params = carLocations
    }

    var showFloatingButton = MockModel()
    func showListingFloatingButton(isHidden: Bool) {
        showFloatingButton.timesCalled += 1
        showFloatingButton.params = isHidden
    }
}

