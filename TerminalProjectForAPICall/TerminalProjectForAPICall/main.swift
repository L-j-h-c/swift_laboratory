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

var userCount = 0
var userGrade: [Int: Int] = [:]
var nextProblem = true

solve()

func solve() {
    service.postStart(scenario: 1)
        .do(onNext: { entity in
            guard let authKey = entity?.authKey else { return }
            NetworkEnvironment.authToken = authKey
        })
        .flatMap { _ in service.fetchUserInfo() }
        .do(onNext: { entity in
            guard let entity else { return }
            userCount = entity.userInfo.count
            for i in 1...userCount {
                userGrade[i] = 1000
            }
        })
        .subscribe(onNext: { _ in
            round(turnNumber: 0)
        }).disposed(by: disposeBag)
}

func solve2() {
    service.postStart(scenario: 2)
        .do(onNext: { entity in
            guard let authKey = entity?.authKey else { return }
            NetworkEnvironment.authToken = authKey
        })
        .flatMap { _ in service.fetchUserInfo() }
        .do(onNext: { entity in
            guard let entity else { return }
            userCount = entity.userInfo.count
            for i in 1...userCount {
                userGrade[i] = 1000
            }
        })
        .subscribe(onNext: { _ in
            round(turnNumber: 0)
        }).disposed(by: disposeBag)
}

func round(turnNumber: Int) {
    var currentGameResult: [GameResult] = []
    var currentWaitings: [WaitingLine] = []
    var matchList: [[Int]] = []
    service.fetchGameResult()
        .do(onNext: { entity in
            guard let entity else { return }
            currentGameResult = entity.gameResult
            currentGameResult.forEach {
                let winId = $0.win
                let loseId = $0.lose
                let takenTime = $0.taken
                userGrade.updateValue(userGrade[winId]! + (100 * (takenTime / 25) * (takenTime / 25)) * userGrade[winId]! / 1000, forKey: winId)
                userGrade.updateValue(userGrade[loseId]! - 50 * takenTime / 25 * userGrade[loseId]! / 1000 * userGrade[loseId]! / 1000, forKey: loseId)
            }
            print("turn \(turnNumber)의 결과", currentGameResult)
            print(userGrade)
        })
        .flatMap { _ in service.fetchWaitngLine() }
        .do(onNext: { entity in
            guard let entity else { return }
            currentWaitings = entity.waitingLine
        })
        .flatMap { _ in
            if currentWaitings.count >= 4 {
                let sortedWaitings = currentWaitings.sorted { userGrade[$0.id]! >= userGrade[$1.id]! }
                for pairIndex in 0..<currentWaitings.count/2 {
                    matchList.append([currentWaitings[pairIndex].id, currentWaitings[pairIndex+1].id])
                }
            }
            
            return service.startMatch(userPairs: matchList)
        }
        .compactMap { $0 }
        .subscribe(onNext: { entity in
            if entity.status != "finished" { round(turnNumber: entity.time) }
            else {
                service.changeUserGrade(usersGrade: userGrade.map { .init(id: $0.key, grade: $0.value)})
                    .flatMap { _ in
                        print(userGrade)
                        return service.fetchScenarioScore()
                    }
                    .compactMap { $0 }
                    .subscribe(onNext: { entity in
                        print("최종 결과", entity)
                        print(userGrade)
                        if nextProblem {
                            solve2()
                            nextProblem = false
                        }
                    }).disposed(by: disposeBag)
            }
        }).disposed(by: disposeBag)
}

func startScenario(scenario: Int) {
    service.postStart(scenario: scenario)
        .subscribe(onNext: { entity in
            guard let authKey = entity?.authKey else { return }
            NetworkEnvironment.authToken = authKey
        }).disposed(by: disposeBag)
}

/// User들의 id와 grade를 불러온다.
func fetchUserInfo() {
    service.fetchUserInfo()
        .subscribe(onNext: { entity in
            guard let entity = entity else { return }
            
        }).disposed(by: disposeBag)
}

/// 현재 대기열에 있는 유저들의 정보를 받아온다.
/// id와 몇 턴부터(from) 대기했는지에 대한 정보가 넘어온다.
func fetchWaitingLine() {
    service.fetchWaitngLine()
        .subscribe(onNext: { entity in
            
        }).disposed(by: disposeBag)
}

/// 해당 턴에 종료된 매치의 결과를 받아온다.
/// win: 이긴 유저의 Id, lose: 진 유저의 Id, taken: 걸린 시간
func fetchGameResult() {
    service.fetchGameResult()
        .subscribe(onNext: { entity in
            print(entity!)
        }).disposed(by: disposeBag)
}

/// Users를 Match시킬 수 있다. 대기중인 유저를 짝지어주며 다음 턴으로 넘어간다.
/// 만약 매치시킬 유저가 없으면 빈 배열을 보내야 한다.
/// - Parameter userPairs: match 시킬 userId들의 pairs를 입력한다.
func startMatch(userPairs: [[Int]]) {
    service.startMatch(userPairs: userPairs)
        .subscribe(onNext: { entity in
            print(entity!.time)
        }).disposed(by: disposeBag)
}

/// Users의 Grade를 바꿀 수 있다.
/// - Parameter usersGrade: Grade를 바꾸고자 하는 유저의 Id 와 Grade 쌍들을 입력한다.
func changeUsersGrade(usersGrade: UserGradeRequest) {
    service.changeUserGrade(usersGrade: usersGrade)
        .subscribe(onNext: { entity in
            print(entity!.status)
            fetchGameResult()
            fetchScenarioScore()
        }).disposed(by: disposeBag)
}

/// 최종적으로 결과를 받아올 수 있다.
func fetchScenarioScore() {
    service.fetchScenarioScore()
        .subscribe(onNext: { entity in
            print(entity!)
        }).disposed(by: disposeBag)
}

RunLoop.main.run()
