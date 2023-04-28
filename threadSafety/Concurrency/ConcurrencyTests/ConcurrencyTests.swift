//
//  ConcurrencyTests.swift
//  ConcurrencyTests
//
//  Created by Junho Lee on 2023/04/29.
//

import XCTest
@testable import Concurrency

final class ConcurrencyTests: XCTestCase {
    
    let standard = 20000.0
    lazy var count = Int(standard / 1.19)

    func testLockPerformance() {
        let lockTest = LockTest()
        let dispatchGroup = DispatchGroup()
        
        let metrics: [XCTMetric] = [
            XCTClockMetric(),
            XCTCPUMetric()
        ]

        let options = XCTMeasureOptions()
        options.iterationCount = 50

        measure(metrics: metrics, options: options) {
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

    func testMyActor() {
        let actor = MyActor()
        let dispatchGroup = DispatchGroup()
        
        let metrics: [XCTMetric] = [
            XCTClockMetric(),
            XCTCPUMetric()
        ]

        let options = XCTMeasureOptions()
        options.iterationCount = 50

        measure(metrics: metrics, options: options) {
            for i in 0..<count {
                dispatchGroup.enter()
                Task {
                    await myActor.performAsyncWork(id: i)
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.wait()
        }
    }
    
    func testSerialQueue() {
        let serial = SerialQueue()
        let dispatchGroup = DispatchGroup()

        let metrics: [XCTMetric] = [
            XCTClockMetric(),
            XCTCPUMetric()
        ]

        let options = XCTMeasureOptions()
        options.iterationCount = 50

        measure(metrics: metrics, options: options) {
            for i in 0..<count {
                dispatchGroup.enter()
                DispatchQueue.global().async {
                    serial.performAsyncWork(id: i)
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.wait()
        }
    }
    
    func testSerialAsync() {
        let serialAsync = SerialAsyncQueue()
        let dispatchGroup = DispatchGroup()
        
        let metrics: [XCTMetric] = [
            XCTClockMetric(),
            XCTCPUMetric()
        ]

        let options = XCTMeasureOptions()
        options.iterationCount = 50

        measure(metrics: metrics, options: options) {
            for i in 0..<count {
                dispatchGroup.enter()
                Task {
                    await serialAsync.performAsyncWork(id: i)
                    dispatchGroup.leave()
                }
            }
            dispatchGroup.wait()
        }
    }
}
