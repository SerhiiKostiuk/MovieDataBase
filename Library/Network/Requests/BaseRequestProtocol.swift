//
//  BaseRequestProtocol.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import Foundation
import Alamofire

protocol BaseRequestProtocol: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var data: Data? { get }
    var headers: [String: String]? { get }
    var serverURL: String { get }
    var versionAPI: String { get }
    
    func asURLRequest() throws -> URLRequest
    
}

extension BaseRequestProtocol {
    
    var headers: [String: String]? {
        
        var headers: [String: String] = [:]

        headers[ServerConstants.HTTPHeaderField.contentType] = ServerConstants.HTTPHeaderValues.json
        headers[ServerConstants.HTTPHeaderField.authorization] = ServerConstants.HTTPHeaderValues.token
        
        return headers
    }
    
    
    func url() throws -> URL {
        let url = try self.serverURL.asURL()
        return url.appending(path: self.path)
    }
    
    /// Elements inserted in URLs
    var parameters: Parameters? {
        return nil
    }
    
    /// This data is sent as the message body of the request
    var data: Data? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        do {
            let url = try self.url()
            var urlRequest = URLRequest(url: url)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            
            urlRequest.httpMethod = self.method.rawValue
            urlRequest.httpBody = self.data
            
            self.headers?.forEach { (key: String, value: String) in
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        
            return urlRequest
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
    }
    
}
