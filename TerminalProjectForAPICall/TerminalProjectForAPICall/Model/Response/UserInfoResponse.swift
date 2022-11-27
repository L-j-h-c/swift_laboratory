//
//  UserInfoResponse.swift
//  TerminalProjectForAPICall
//
//  Created by Junho Lee on 2022/11/27.
//

import Foundation

struct UserInfoResponse: Codable {
    let userInfo: [UserInfo]

    enum CodingKeys: String, CodingKey {
        case userInfo = "user_info"
    }
}

// MARK: - UserInfo
struct UserInfo: Codable {
    let id, grade: Int
}
