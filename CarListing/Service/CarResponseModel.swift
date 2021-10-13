//
//  CarResponseModel.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

typealias CarList = [Car]

struct Car: Decodable {
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let fuelLevel: Float
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let carImageUrl: String?
    let color: String
    let innerCleanliness: InnerCleanliness
}

enum InnerCleanliness: String, Codable {
    case clean = "CLEAN"
    case regular = "REGULAR"
    case veryClean = "VERY_CLEAN"

    var cleanlinessText: String {
        switch self {
        case .clean:
            return "Good"
        case .veryClean:
            return "Excellent"
        case .regular:
            return "Average"
        }
    }
}
