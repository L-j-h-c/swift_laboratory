//
//  BaseRouter.swift
//  RD-NetworkTests
//
//  Created by Junho Lee on 2022/10/14.
//  Copyright © 2022 RecorDream. All rights reserved.
//

import Foundation

import Alamofire

public protocol BaseRouter: URLRequestConvertible {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var header: HeaderType { get }
    var multipart: MultipartFormData { get }
    var parameterEncoding: ParameterEncoding { get }
}

// MARK: asURLRequest()

extension BaseRouter {
    
    // URLRequestConvertible 구현
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        
        urlRequest = self.makeHeaderForRequest(to: urlRequest)
        
        return try self.makeParameterForRequest(to: urlRequest, with: url)
    }
    
    private func makeHeaderForRequest(to request: URLRequest) -> URLRequest {
        var request = request
        
        switch header {
        case .default:
            request.setValue(HeaderContent.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            
        case .withXAuthToken:
            request.setValue(HeaderContent.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            request.setValue(HeaderContent.accessTokenSerial.rawValue, forHTTPHeaderField: HTTPHeaderField.xAuth.rawValue)
            
        case .withToken:
            request.setValue(HeaderContent.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            request.setValue(NetworkEnvironment.authToken, forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
            
        case .multiPart:
            request.setValue(HeaderContent.multiPart.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        }
        
        return request
    }
    
    private func makeParameterForRequest(to request: URLRequest, with url: URL) throws -> URLRequest {
        var request = request
        
        switch parameters {
            
        case .query(let query, let parameterEncoding):
            request = try parameterEncoding.encode(request, with: query)
            
        case .requestBody(let body):
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            
        case .queryBody(let query, let body, let parameterEncoding):
            request = try parameterEncoding.encode(request, with: query)
            
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            
        case .requestPlain:
            break
        }
        
        return request
    }
}

// MARK: baseURL & header

extension BaseRouter {
    var baseURL: String {
        return URLConstants.baseURL
    }
    
    var header: HeaderType {
        return HeaderType.withXAuthToken
    }
    
    var multipart: MultipartFormData {
        return MultipartFormData()
    }
}

// MARK: ParameterType

public enum RequestParams {
    case queryBody(_ query: [String: Any], _ body: [String: Any], parameterEncoding: ParameterEncoding = JSONEncoding.default)
    case query(_ query: [String: Any], parameterEncoding: ParameterEncoding = JSONEncoding.default)
    case requestBody(_ body: [String: Any])
    case requestPlain
}

