//
//  MockMapListWireframe.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class MockMapListWireframe: MapListWireframeProtocol {

    let router: RouterType

    init(router: RouterType) {
        self.router = router
    }

    var isBannerViewShown = MockModel()
    func showBannerView(from parentView: UIViewController, bannerData: CarListingBannerViewData) {
        isBannerViewShown.timesCalled += 1
    }
}
