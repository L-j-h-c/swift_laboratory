//
//  ActorNSLock.swift
//  ConcurrencyTests
//
//  Created by Junho Lee on 2023/05/11.
//

import XCTest
@testable import Concurrency
import Foundation

class NSLockPerformanceTests: XCTestCase {
    var iterations = 1000000
    var metricsCount = 10
    
    func testNSLockPerformance() {
        let lock = NSLock()
        var counter = 0
        
        let group = DispatchGroup()
        
        let metrics: [XCTMetric] = [
            XCTClockMetric(),
//            XCTCPUMetric()
        ]
        
        let options = XCTMeasureOptions()
        options.iterationCount = metricsCount
        
        measure(metrics: metrics, options: options) {
            for _ in 0..<iterations {
                group.enter()
                
                DispatchQueue.global().async {
                    lock.lock()
                    counter += 1
                    lock.unlock()
                    group.leave()
                }
            }
            
            group.wait()
        }
    }
}

class ActorPerformanceTests: XCTestCase {
    var iterations = 1000000
    var metricsCount = 10
    
    func testActorPerformance() {
        let counter = Counter()
        
        let group = DispatchGroup()
        
        let metrics: [XCTMetric] = [
            XCTClockMetric(),
//            XCTCPUMetric()
        ]
        
        let options = XCTMeasureOptions()
        options.iterationCount = metricsCount
        
        measure(metrics: metrics, options: options) {
            for _ in 0..<iterations {
                group.enter()
                Task {
                    await counter.increment()
                    group.leave()
                }
            }
            
            group.wait()
        }
    }
}
