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
    let fuelLevel: Double
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let carImageUrl: String?
}
