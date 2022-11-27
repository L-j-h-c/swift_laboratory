//
//  RecordRouter.swift
//  RD-NetworkTests
//
//  Created by Junho Lee on 2022/10/14.
//  Copyright © 2022 RecorDream. All rights reserved.
//

import Foundation

import Alamofire

enum KakaoRouter {
    case postStart(scenario: Int)
}

extension KakaoRouter: BaseRouter {
    var method: HTTPMethod {
        switch self {
        case .postStart: return .post
        default: return .get
        }
    }
    
    var path: String {
        switch self {
        case .postStart:
            return "/start"
        default: return ""
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postStart(let scenario):
            let query: [String: Any] = [
                "problem": scenario
            ]
            return .query(query)
        default: return .requestPlain
        }
    }
}
