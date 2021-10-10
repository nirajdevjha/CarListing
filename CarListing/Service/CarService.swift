//
//  CarService.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

protocol CarServiceProvider {
    func fetchCarList(completion: @escaping (Result<CarList, APIError>) -> Void)
}

final class CarService {
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension CarService: CarServiceProvider {
    func fetchCarList(completion: @escaping (Result<CarList, APIError>) -> Void) {
        return networkManager.fetch(
            using: CarRequest(),
            completion: { (result: Result<CarList, APIError>) in
                completion(result)
            }
        )
    }
}
