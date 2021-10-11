//
//  CarListInteractor.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

class CarListInteractor: CarListInteractorProtocol {
    let carList: CarList

    init(carList: CarList) {
        self.carList = carList
    }

    func getCarList() -> CarList {
        return carList
    }
}
