//
//  MockCarListWireframe.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class MockCarListWireframe: CarListWireframeProtocol {

    let router: RouterType

    init(router: RouterType) {
        self.router = router
    }
}
