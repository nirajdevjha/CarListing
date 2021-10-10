//
//  NetworkingProtocols.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkRequestData {
    var scheme: String { get }
    var host: String { get }
    var requestMethod: RequestMethod { get }
    var endPoint: String { get }
    var parameters: [URLQueryItem] { get }
    var body: Data? { get }
}
