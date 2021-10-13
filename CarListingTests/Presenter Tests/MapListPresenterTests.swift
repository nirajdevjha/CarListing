//
//  MapListPresenterTests.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class MapListPresenterTests: XCTestCase {

    var presenter: MapListPresenter!
    var mockInteractor: MockMapListInteractor!
    var mockView: MockMapListViewController!
    var mockWireframe: MockMapListWireframe!

    let testCarList = [Car(id: "123", modelIdentifier: "1", modelName: "Mini", name: "Test", make: "BMW", fuelLevel: 0.5, licensePlate: "ABC-123", latitude: 11.2, longitude: 10.5, carImageUrl: "testImage", color: "Black", innerCleanliness: InnerCleanliness.veryClean)]

    override func setUpWithError() throws {
        mockInteractor = MockMapListInteractor()
        mockView = MockMapListViewController()
        let router = Router(dependencies: Dependencies(reachability: MockReachability()))
        mockWireframe = MockMapListWireframe(router: router)
        presenter = MapListPresenter(interactor: mockInteractor, view: mockView, wireframe: mockWireframe)
    }

    override func tearDownWithError() throws {
        presenter = nil
        mockInteractor = nil
        mockView = nil
    }

    func testCarListShown() {
        mockInteractor.carlist = testCarList
        presenter.viewDidLoad()
        XCTAssertEqual(mockView.isSetInitialLocation.timesCalled, 1)
        XCTAssertEqual(mockView.isMarkCars.timesCalled, 1)
    }

    func testCarListCreation() {
        mockInteractor.carlist = testCarList
        presenter.viewDidLoad()
        XCTAssertFalse(presenter.carList.isEmpty, "car list should not empty")
        XCTAssertEqual(presenter.carList.count, 1)
        XCTAssertEqual(presenter.carList.first?.name, "Test")
    }

    func testErrorBannerShown() {
        presenter.viewDidLoad()
        XCTAssertEqual(mockWireframe.isBannerViewShown.timesCalled, 1)
        XCTAssertTrue(presenter.carList.isEmpty, "car list should be empty")
    }
}
