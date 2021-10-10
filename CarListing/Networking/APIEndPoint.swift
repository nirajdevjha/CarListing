//
//  APIEndPoint.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

enum APIEndPoint {
    case cars
    
    var scheme: String {
        switch self {
        case .cars:
            return APIEndPoint.Constants.scheme
        }
    }
    
    var host: String {
        switch self {
        case .cars:
            return APIEndPoint.Constants.host
        }
    }
    
    var path: String {
        switch self {
        case .cars:
            return "/codingtask/cars"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .cars:
            return []
        }
    }
}

private extension APIEndPoint {
    enum Constants {
        static let scheme = "https"
        static let host = "cdn.sixt.io"
    }
}
