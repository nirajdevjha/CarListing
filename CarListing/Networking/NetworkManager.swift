//
//  NetworkManager.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<T: Decodable>(
        using networkRequestData: NetworkRequestData,
        completion: @escaping (Result<T, APIError>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    let jsonDecoder: JSONDecodeProvider

    init(jsonDecoder: JSONDecodeProvider = JSONKeySnakeCaseDecoder()) {
        self.jsonDecoder = jsonDecoder
    }

    func fetch<T>(
        using networkRequestData: NetworkRequestData,
        completion: @escaping (Result<T, APIError>) -> Void) where T: Decodable  {

        var components = URLComponents()
        components.scheme = networkRequestData.scheme
        components.host = networkRequestData.host
        components.path = networkRequestData.endPoint
        components.queryItems = networkRequestData.parameters

        guard let url = components.url else {
            completion(.failure(.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = networkRequestData.requestMethod.rawValue

        if let body = networkRequestData.body {
            request.httpBody = body
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode
            else {
                completion(.failure(.other(message: "Something went wrong")))
                return
            }
            let responseStatus = self.isValidResposne(statusCode: statusCode)
            switch responseStatus {
            case .success:
                do {
                    if let responseData = data {
                        let decodeResponse: T = try self.jsonDecoder.decode(data: responseData)
                        completion(.success(decodeResponse))
                    } else {
                        completion(.failure(.noResponseData))
                    }
                } catch let error {
                    completion(.failure(.unableToDecodeResponseData(errorDescription: error.localizedDescription)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func isValidResposne(statusCode: Int) -> Result<String, APIError>{
        switch statusCode {
        case 200...299:
            return .success("Valid Response")
        case 400:
            return .failure(APIError.badRequest)
        case 401:
            return .failure(APIError.authenticationError)
        case 500:
            return .failure(APIError.internalServer)
        default:
            return .failure(APIError.failed)
        }
    }
}
