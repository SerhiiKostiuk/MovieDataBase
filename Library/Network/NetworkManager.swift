//
//  NetworkManager.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import Foundation
import Alamofire
import Combine

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

final class NetworkManager {
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    func request<T: Decodable>(_ urlRequest: URLRequestConvertible, _ type: T.Type) -> AnyPublisher<T, AFError> {
        return AF.request(urlRequest)
            .publishDecodable(type: type)
            .value()
            .eraseToAnyPublisher()
    }
    
    func request<T: Decodable>(_ urlRequest: URLRequestConvertible, _ type: T.Type) async throws -> T {
        try await AF.request(urlRequest)
            .serializingDecodable(type)
            .value
    }
}

