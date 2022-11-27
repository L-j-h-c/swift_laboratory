//
//  PostStartResponse.swift
//  TerminalProjectForAPICall
//
//  Created by Junho Lee on 2022/11/27.
//

import Foundation

public struct PostStartResponse: Codable {
    let authKey: String
    let problem, time: Int
    
    enum CodingKeys: String, CodingKey {
        case authKey = "auth_key"
        case problem, time
    }
}
