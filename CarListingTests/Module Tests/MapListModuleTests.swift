//
//  MapListModuleTests.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class MapListModuleTests: XCTestCase {

    func testMapModuleSetup() {
        let module = Module.carMapList
        let router = Router(dependencies: Dependencies(reachability: MockReachability()))
        let launchableModule = router.launchable(for: module)
        XCTAssertNotNil(launchableModule, "MapListModule was expected but returned nil")
        XCTAssertTrue(launchableModule is MapListModule, "Expected module should be of type MapListModule")
        let viewController = launchableModule?.viewController as? MapListViewController
        XCTAssertNotNil(viewController, "Expected viewController should be MapListViewController")
    }
}
