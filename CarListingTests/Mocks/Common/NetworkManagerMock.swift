//
//  NetworkManagerMock.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class NetworkManagerMock: NetworkManagerProtocol {

    let mockFileName: String
    let `extension`: String
    let jsonDecoder: JSONDecodeProvider

    init(
        mockFileName: String,
        extension: String = "json",
        jsonDecoder: JSONDecodeProvider = JSONKeySnakeCaseDecoder()
    ) {
        self.mockFileName = mockFileName
        self.extension = `extension`
        self.jsonDecoder = jsonDecoder
    }

    func fetch<T>(using networkRequestData: NetworkRequestData, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        guard let data = getData(for: mockFileName, extension: `extension`) else {
            completion(.failure(APIError.noResponseData))
            return
        }
        do {
            let decodeResponse: T = try self.jsonDecoder.decode(data: data)
            completion(.success(decodeResponse))

        } catch let error {
            print(error)
            completion(.failure(.unableToDecodeResponseData(errorDescription: "")))
        }
    }

    private func getData(for fileName: String, extension: String) -> Data? {
        let url = Bundle(for: NetworkManagerMock.self).url(forResource: fileName, withExtension: `extension`)
        guard let validUrl = url,
              let data = try? Data(contentsOf: validUrl) else {
            return nil
        }
        return data
    }
}
