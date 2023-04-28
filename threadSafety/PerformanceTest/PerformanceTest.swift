//
//  PerformanceTest.swift
//  PerformanceTest
//
//  Created by Junho Lee on 2023/04/29.
//

import XCTest
import actorTest

final class PerformanceTest: XCTestCase {

    func testLockPerformance() {
        let lockTest = LockTest()
        let count = 1000
        let dispatchGroup = DispatchGroup()
        
        measure {
            for i in 0..<count {
                dispatchGroup.enter()
                DispatchQueue.global().async {
                    lockTest.performAsyncWork(id: i)
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.wait()
        }
    }
}
