//
//  CarListWireframe.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

final class CarListWireframe: CarListWireframeProtocol {

    let router: RouterType

    init(router: RouterType) {
        self.router = router
    }
}
