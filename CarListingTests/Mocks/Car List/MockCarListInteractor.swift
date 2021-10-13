//
//  MockCarListInteractor.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class MockCarListInteractor: CarListInteractorProtocol {

    init() { }

    func getCarList() -> CarList {
        let testCarList = [Car(id: "123", modelIdentifier: "1", modelName: "Mini", name: "Clarence", make: "BMW", fuelLevel: 0.5, licensePlate: "ABC-123", latitude: 11.2, longitude: 10.5, carImageUrl: "testImage", color: "Black", innerCleanliness: InnerCleanliness.veryClean),
                           Car(id: "321", modelIdentifier: "2", modelName: "Mini", name: "Patty", make: "BMW", fuelLevel: 0.9, licensePlate: "XYZ-123", latitude: 11.2, longitude: 10.5, carImageUrl: "testImage", color: "Midnight black", innerCleanliness: InnerCleanliness.clean)
        ]
        return testCarList
    }

}

