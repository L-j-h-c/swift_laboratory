//
//  RecordService.swift
//  RD-NetworkTests
//
//  Created by Junho Lee on 2022/10/14.
//  Copyright © 2022 RecorDream. All rights reserved.
//

import Foundation

import Alamofire
import RxSwift

public protocol KakaoService {
    func postStart(scenario: Int) -> Observable<PostStartResponse?>
}

public class DefaultKakaoService: BaseService {
    public static let shared = DefaultKakaoService()
    
    private override init() {}
}

extension DefaultKakaoService: KakaoService {
    public func postStart(scenario: Int) -> RxSwift.Observable<PostStartResponse?> {
        requestObjectInRx(KakaoRouter.postStart(scenario: scenario))
    }
}
