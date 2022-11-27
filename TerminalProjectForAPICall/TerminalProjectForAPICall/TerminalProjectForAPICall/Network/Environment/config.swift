//
//  config.swift
//  RD-NetworkTests
//
//  Created by Junho Lee on 2022/10/14.
//  Copyright © 2022 RecorDream. All rights reserved.
//

import Foundation

struct IDLiterals {
    
}

struct URLConstants {
    
    // MARK: - Base URL
    static let baseURL = "https://huqeyhi95c.execute-api.ap-northeast-2.amazonaws.com/prod"
}

struct NetworkEnvironment {
    
    // MARK: - timeOut
    static let requestTimeOut = TimeInterval(10)
    static let resourceTimeOut = TimeInterval(10)
    
    // MARK: - Token
    static var authToken = ""
}
