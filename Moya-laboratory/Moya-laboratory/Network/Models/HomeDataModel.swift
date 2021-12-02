//
//  HomeDataModel.swift
//  Moya-laboratory
//
//  Created by Junho Lee on 2021/12/02.
//

import Foundation

// MARK: - Welcome
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - DataClass
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
