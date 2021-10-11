//
//  MapListWireframe.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import Foundation

final class MapListWireframe: MapListWireframeProtocol {

    let router: RouterType

    init(router: RouterType) {
        self.router = router
    }
}
