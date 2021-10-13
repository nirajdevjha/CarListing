//
//  CarServiceTests.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class CarServiceTests: XCTestCase {

    func testCarAPISuccessWithValidJSON() {
        let networkManager: NetworkManagerProtocol = NetworkManagerMock(
            mockFileName: "carValid"
        )
        let expectation = self.expectation(description: "car-response")
        let service = CarService(networkManager: networkManager)

        service.fetchCarList { result in
            switch result {
            case .success(let carList):
                expectation.fulfill()
                XCTAssertNotNil(carList, "car response should not be nil")
            case .failure:
                expectation.fulfill()
                XCTFail("car Api cannot succeed with invalid json")
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }

    func testCarAPIWithInvalidJSON() {
        let networkManager: NetworkManagerProtocol = NetworkManagerMock(
            mockFileName: "carInvalid"
        )
        let expectation = self.expectation(description: "car-invalid-response")
        let service = CarService(networkManager: networkManager)

        service.fetchCarList { result in
            switch result {
            case .success:
                expectation.fulfill()
                XCTFail("car Api cannot succeed with invalid json")
            case .failure:
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
}
