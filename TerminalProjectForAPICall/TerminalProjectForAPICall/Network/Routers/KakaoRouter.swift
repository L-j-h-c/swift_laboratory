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
    case fetchWaitingLine
    case fetchGameResult
    case fetchUserInfo
    case startMatch(userPairs: [[Int]])
    case changeUsersGrade(usersGrade: UserGradeRequest)
    case fetchScenarioScore
}

extension KakaoRouter: BaseRouter {
    var method: HTTPMethod {
        switch self {
        case .postStart: return .post
        case .startMatch, .changeUsersGrade: return .put
        default: return .get
        }
    }
    
    var path: String {
        switch self {
        case .postStart:
            return "/start"
        case .fetchWaitingLine:
            return "/waiting_line"
        case .fetchGameResult:
            return "/game_result"
        case .fetchUserInfo:
            return "/user_info"
        case .startMatch:
            return "/match"
        case .changeUsersGrade:
            return "/change_grade"
        case .fetchScenarioScore:
            return "/score"
        default: return ""
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postStart(let scenario):
            let query: [String: Any] = [
                "problem": scenario
            ]
            return .query(query)
        case .startMatch(let userPairs):
            let query: [String: Any] = [
                "pairs": userPairs
            ]
            return .query(query)
        case .changeUsersGrade(let usersGrade):
            // struct는 그대로 들어갔을 때에 인코딩이 안된다. 따라서 아래와 같이 딕셔너리로 만들어주기.
            let usersGrades = usersGrade.map { ["id": $0.id,
                                                "grade": $0.grade] }
            
            let query: [String: Any] = [
                "commands": usersGrades
            ]
            return .query(query)
        default: return .requestPlain
        }
    }
    
    var header: HeaderType {
        switch self {
        case .postStart:
            return .withXAuthToken
        default:
            return .withToken
        }
    }
}
