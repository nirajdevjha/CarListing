//
//  CarRequest.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

struct CarRequest: NetworkRequestData {

    var scheme: String {
        return APIEndPoint.cars.scheme
    }

    var host: String {
        return APIEndPoint.cars.host
    }

    var endPoint: String {
        return APIEndPoint.cars.path
    }

    var parameters: [URLQueryItem] {
        return APIEndPoint.cars.parameters
    }

    var requestMethod: RequestMethod {
        .get
    }

    private(set) var body: Data?
}
