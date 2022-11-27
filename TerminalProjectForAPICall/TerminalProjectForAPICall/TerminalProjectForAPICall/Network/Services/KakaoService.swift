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
    func writeDreamRecord(title: String, date: String, content: String, emotion: Int, genre: [Int], note: String?, voice: String?) -> Observable<DreamWriteResponse?>
}

public class DefaultKakaoService: BaseService {
    public static let shared = DefaultKakaoService()
    
    private override init() {}
}

extension DefaultKakaoService: KakaoService {
    public func writeDreamRecord(title: String, date: String, content: String, emotion: Int, genre: [Int], note: String?, voice: String?) -> RxSwift.Observable<DreamWriteResponse?> {
        requestObjectInRx(KakaoRouter.writeRecord(title: title, date: date, content: content, emotion: emotion, genre: genre, note: note, voice: voice))
    }
}
