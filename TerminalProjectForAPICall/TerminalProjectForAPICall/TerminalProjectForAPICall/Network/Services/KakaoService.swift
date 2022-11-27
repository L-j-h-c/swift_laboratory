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

protocol KakaoService {
    func postStart(scenario: Int) -> Observable<PostStartResponse?>
    func fetchWaitngLine() -> Observable<WaitingLineResponse?>
}

class DefaultKakaoService: BaseService {
    static let shared = DefaultKakaoService()
    
    private override init() {}
}

extension DefaultKakaoService: KakaoService {
    func postStart(scenario: Int) -> RxSwift.Observable<PostStartResponse?> {
        requestObjectInRx(KakaoRouter.postStart(scenario: scenario))
    }
    
    func fetchWaitngLine() -> RxSwift.Observable<WaitingLineResponse?> {
        requestObjectInRx(KakaoRouter.fetchWaitingLine)
    }
}
