//
//  Config.swift
//  Network
//
//  Created by 이준호 on 2022/10/06.
//  Copyright © 2022 SOPT-Stamp-iOS. All rights reserved.
//

import Foundation

public struct Config {
    public enum Network {
        public static var baseURL: String {
            return ""
        }
        
        public static var ARN: String {
            return "arn:aws:sns:ap-northeast-2:379013966998:app/APNS/Makers-iOS"
        }
    }
}
