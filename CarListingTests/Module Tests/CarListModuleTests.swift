//
//  CarListModuleTests.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class CarListModuleTests: XCTestCase {

    func testMapModuleSetup() {
        let module = Module.carList(carList: [])
        let router = Router(dependencies: Dependencies(reachability: MockReachability()))
        let launchableModule = router.launchable(for: module)
        XCTAssertNotNil(launchableModule, "CarListModule was expected but returned nil")
        XCTAssertTrue(launchableModule is CarListModule, "Expected module should be of type CarListModule")
        let viewController = launchableModule?.viewController as? CarListViewController
        XCTAssertNotNil(viewController, "Expected viewController should be CarListViewController")
    }
}
