//
//  NotiList.swift
//  Core
//
//  Created by 이준호 on 2022/10/06.
//  Copyright © 2022 SOPT-Stamp-iOS. All rights reserved.
//

import Foundation

/// enum형 NotiList를 Notification.Name으로 return
/// - ex) NotificationCenter.default.post(name: NotiList.makeNotiName(list: <NotiList>), object: <>, userInfo: <>)
public enum NotiList: String {
    case sample
    
    public static func makeNotiName(list: NotiList) -> NSNotification.Name {
        return Notification.Name(String(describing: list))
    }
}
