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
    case withToken
    case multiPart
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case authorization = "X-Auth-Token"
}

enum HeaderContent: String {
    case json = "application/json"
    case multiPart = "multipart/form-data"
    case accessTokenSerial = "96431c6a17a0a639265da2c33775bf3f"
}
