//
//  MapListInteractor.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import Foundation

class MapListInteractor: MapListInteractorProtocol {

    let reachability: ReachabilityType
    private let service: CarServiceProvider
    weak var presenter: MapListInteractorOutputProtocol?

    init(reachability: ReachabilityType, service: CarServiceProvider) {
        self.reachability = reachability
        self.service = service
    }

    /// Fetch car list from api
    ///
    /// - Parameters:
    ///   - success: completion for success
    ///   - failure: completion for failure
    func fetchCarList(success: @escaping ((CarList) -> Void),
                      failure: @escaping ((APIError) -> Void)) {
        service.fetchCarList { result in
            switch result {
            case .success(let carList):
                success(carList)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
