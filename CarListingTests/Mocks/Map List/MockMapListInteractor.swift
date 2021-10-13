//
//  MockMapListInteractor.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//


import XCTest
@testable import CarListing

class MockMapListInteractor: MapListInteractorProtocol {
    var presenter: MapListInteractorOutputProtocol?
    let reachability: ReachabilityType = MockReachability()
    var carlist: CarList = []

    init() { }

    func fetchCarList(success: @escaping ((CarList) -> Void), failure: @escaping ((APIError) -> Void)) {
        if !carlist.isEmpty {
            success(carlist)
        } else {
            failure(.noResponseData)
        }

    }
}
