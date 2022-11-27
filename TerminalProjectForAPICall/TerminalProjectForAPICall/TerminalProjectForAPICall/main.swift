//
//  main.swift
//  TerminalProjectForAPICall
//
//  Created by Junho Lee on 2022/11/27.
//

import Foundation

import RxSwift
import RxCocoa

let disposeBag = DisposeBag()
let service = DefaultKakaoService.shared

let scenarioStarted = PublishRelay<Void>()

startScenario(scenario: 1)

func startScenario(scenario: Int) {
    service.postStart(scenario: scenario)
        .subscribe(onNext: { entity in
            guard let authKey = entity?.authKey else { return }
            NetworkEnvironment.authToken = authKey
            fetchGameResult()
            fetchWaitingLine()
            fetchUserInfo()
            startMatch(userPairs: [[1,2], [3,4]])
        }).disposed(by: disposeBag)
}

func fetchWaitingLine() {
    service.fetchWaitngLine()
        .subscribe(onNext: { entity in
        print(entity!)
    }).disposed(by: disposeBag)
}

func fetchGameResult() {
    service.fetchGameResult()
        .subscribe(onNext: { entity in
        print(entity!)
    }).disposed(by: disposeBag)
}

func fetchUserInfo() {
    service.fetchUserInfo()
        .subscribe(onNext: { entity in
        print(entity!)
    }).disposed(by: disposeBag)
}

func startMatch(userPairs: [[Int]]) {
    service.startMatch(userPairs: userPairs)
        .subscribe(onNext: { entity in
            print(entity!.time)
        }).disposed(by: disposeBag)
}

RunLoop.main.run()
