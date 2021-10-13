//
//  CarListPresenterTests.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class CarListPresenterTests: XCTestCase {

    var presenter: CarListPresenter!
    var mockInteractor: MockCarListInteractor!
    var mockView: MockCarListViewController!
    var mockWireframe: MockCarListWireframe!

    override func setUpWithError() throws {
        mockInteractor = MockCarListInteractor()
        mockView = MockCarListViewController()
        let router = Router(dependencies: Dependencies(reachability: MockReachability()))
        mockWireframe = MockCarListWireframe(router: router)
        presenter = CarListPresenter(interactor: mockInteractor, view: mockView, wireframe: mockWireframe)
    }

    override func tearDownWithError() throws {
        presenter = nil
        mockInteractor = nil
        mockView = nil
    }

    func testCarListShown() {
        presenter.viewDidLoad()
        XCTAssertEqual(mockView.isReloadTable.timesCalled, 1)
    }

    func testNumberOfRowsInTable() {
        presenter.viewDidLoad()
        let numOfRows = presenter.numberOfRows(in: 0)
        XCTAssertEqual(numOfRows, 3, "expected number of rows is 3")
    }

    func testCarListCellViewModel() {
        presenter.viewDidLoad()
        let cellViewModel = presenter.getCellViewModel(for: 0)
        XCTAssertEqual(cellViewModel?.rowType, .info, "expected row type is car info")
        if let cellVM = cellViewModel as? CarInfoCellViewModel {
            XCTAssertEqual(cellVM.nameMake, "Clarence | BMW")
            XCTAssertEqual(cellVM.carImage, "testImage")
            XCTAssertEqual(cellVM.licensePlate, "ABC-123")
            XCTAssertEqual(cellVM.fuelText, "Fuel: 50 %")
        }
    }

    func testSeparatorCellViewModel() {
        presenter.viewDidLoad()
        let cellViewModel = presenter.getCellViewModel(for: 1)
        XCTAssertEqual(cellViewModel?.rowType, .separator, "expected row type is separator")
        if let cellVM = cellViewModel as? SeparatorCellViewModel {
            XCTAssertEqual(cellVM.separatorColor, UIColor.separatorColor)
        }
    }
}
