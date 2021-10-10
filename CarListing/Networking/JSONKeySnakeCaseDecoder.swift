//
//  JSONKeySnakeCaseDecoder.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

protocol JSONDecodeProvider {
    var jsonKeyDecodeStrategy: JSONDecoder.KeyDecodingStrategy { get }
    func decode<T: Decodable>(data: Data) throws -> T
}

struct JSONKeySnakeCaseDecoder: JSONDecodeProvider {
    
    var jsonKeyDecodeStrategy: JSONDecoder.KeyDecodingStrategy {
        .convertFromSnakeCase
    }
    
    func decode<T: Decodable>(data: Data) throws -> T {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = jsonKeyDecodeStrategy
        return try jsonDecoder.decode(T.self, from: data)
    }
}
