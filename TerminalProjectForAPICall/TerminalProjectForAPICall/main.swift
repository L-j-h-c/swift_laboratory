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

var waitingWeight: Double = 6
var maximumGradeDiff = 400.0
var userAverageGrade: Int = 0
var gradeDiffDivider: Double = 0

setEnvrionments()
solve()

func setEnvrionments() {
    userAverageGrade = 4000
    waitingWeight = 6
    maximumGradeDiff = 400.0
    gradeDiffDivider = 20
}

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
                userGrade[i] = userAverageGrade
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
                userGrade[i] = userAverageGrade
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
                let winGrade = Double(userGrade[$0.win]!)
                let loseGrade = Double(userGrade[$0.lose]!)
                let takenTime = Double($0.taken)
                
                let gradeDiff: Double = winGrade - loseGrade
                var loserDiffWeight: Double = 0
                var winnerDiffWeight: Double = 0
                if gradeDiff >= 0 {
                    //                    winnerDiffWeight = gradeDiff / 50
                    //                    loserDiffWeight = -gradeDiff / 50
                } else {
                    winnerDiffWeight = -gradeDiff / gradeDiffDivider
                    loserDiffWeight = gradeDiff / gradeDiffDivider
                }
                
                let updateWinValue = winGrade + (100 * (25 / takenTime)) + winnerDiffWeight * (takenTime / 25)
                let updateLoseValue = loseGrade - (100 * (25 / takenTime)) + loserDiffWeight * (takenTime / 25)
                if nextProblem && takenTime < 10 {
                    
                } else {
                    userGrade.updateValue(Int(updateWinValue), forKey: $0.win)
                    if updateLoseValue > 0 {
                        userGrade.updateValue(Int(updateLoseValue), forKey: $0.lose)
                    }
                }
            }
            print("turn \(turnNumber): ",userGrade)
        })
            .flatMap { _ in service.fetchWaitngLine() }
            .do(onNext: { entity in
                guard let entity else { return }
                currentWaitings = entity.waitingLine
                print("대기자:", currentWaitings.count)
            })
                .flatMap { _ in
                    let sortedWaitings = currentWaitings.sorted { userGrade[$0.id]! >= userGrade[$1.id]! }
                    var i = 0
                    while (i+1 < currentWaitings.count) {
                        let diff = (userGrade[sortedWaitings[i].id]! - userGrade[sortedWaitings[i+1].id]!)
                        let waited = turnNumber - sortedWaitings[i].from + 1
                        let weightedDiff = Double(diff) / (Double(waited) / waitingWeight)
                        if weightedDiff <= maximumGradeDiff {
                            matchList.append([sortedWaitings[i].id, sortedWaitings[i+1].id])
                            i += 2
                        } else {
                            i += 1
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

RunLoop.main.run()
