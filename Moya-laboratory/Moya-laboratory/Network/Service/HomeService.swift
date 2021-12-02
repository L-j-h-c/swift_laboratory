//
//  HomeService.swift
//  Moya-laboratory
//
//  Created by Junho Lee on 2021/12/02.
//

import Foundation
import Moya
import UIKit

enum HomeService {
    case signUp(email: String, name: String, password: String)
}

extension HomeService: TargetType {
    public var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }

    var path: String {
        switch self {
        case .signUp:
            return "/user/signup"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        }
    }
    
    var task: Task {
        switch self{
        case .signUp(let email,let name, let password):
            return .requestParameters(parameters: [
                "email" : email,
                "name" : name,
                "password" : password
            ], encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }


}
