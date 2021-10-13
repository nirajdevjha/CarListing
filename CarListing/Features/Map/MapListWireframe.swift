//
//  MapListWireframe.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

final class MapListWireframe: MapListWireframeProtocol {

    let router: RouterType

    init(router: RouterType) {
        self.router = router
    }

    func showBannerView(from parentView: UIViewController, bannerData: CarListingBannerViewData) {
        CarListingBannerView.showBannerView(from: parentView.view, bannerData: bannerData)
    }
}
