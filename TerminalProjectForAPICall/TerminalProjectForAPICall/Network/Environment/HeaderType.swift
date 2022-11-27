//
//  HeaderType.swift
//  RD-NetworkTests
//
//  Created by Junho Lee on 2022/10/14.
//  Copyright © 2022 RecorDream. All rights reserved.
//

import Foundation

public enum HeaderType {
    case `default`
    case withXAuthToken
    case withToken
    case multiPart
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case xAuth = "X-Auth-Token"
    case authorization = "Authorization"
}

enum HeaderContent: String {
    case json = "application/json"
    case multiPart = "multipart/form-data"
    case accessTokenSerial = "a672a6f84dc3be164f29e61ae06a1032"
}
