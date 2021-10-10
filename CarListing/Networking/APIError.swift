//
//  APIError.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

public enum APIError: Error {
    case invalidUrl
    case authenticationError
    case badRequest
    case failed
    case noResponseData
    case internalServer
    case unableToDecodeResponseData(errorDescription: String)
    case other(message: String?)
    
    var errorDescription: String{
        let message: String
        switch self {
        case .invalidUrl:
            message = "Invalid url"
        case .authenticationError:
            message = "Authenticatioon failed"
        case .badRequest:
            message = "Bad request"
        case .failed:
            message = "API request failed"
        case .noResponseData:
            message = "Empty response data"
        case .internalServer:
            message = "Something went wrong"
        case .unableToDecodeResponseData:
            message = "Unable to decode response object"
        case let .other(errorMessage):
            message = errorMessage ?? ""
        }
        return message
    }
}
