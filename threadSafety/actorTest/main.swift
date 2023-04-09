//
//  main.swift
//  actorTest
//
//  Created by Junho Lee on 2023/04/08.
//

import Foundation

let time = Date()
var standard = 0

actor MyActor {
    var counter: Int = 0
    
    func incrementCounter() {
        counter += 1
        print("Counter incremented to: \(counter)")
        if counter == standard {
            let now = Date()
            print(now.timeIntervalSince(time))
        }
    }
    
    func performAsyncWork(id: Int) async {
        print("Starting work: \(id)")
        //        let count = counter
        incrementCounter()
        print("Finished work: \(id)")
    }
    
    func rewriteWork(id: Int) async {
        print("rewrite: \(id)")
    }
}

class SerialQueue {
    var counter: Int = 0
    let queue = DispatchQueue(label: "serial")
    
    func incrementCounter() {
        counter += 1
        print("Counter incremented to: \(counter)")
        if counter == standard {
            let now = Date()
            print(now.timeIntervalSince(time))
        }
    }
    
    func performAsyncWork(id: Int) {
        queue.sync {
            print("Starting work: \(id)")
            incrementCounter()
            print("Finished work: \(id)")
        }
    }
    
    func rewriteWork(id: Int) {
        print("rewrite: \(id)")
    }
}

class SerialAsyncQueue {
    var counter: Int = 0
    let queue = DispatchQueue(label: "serial")
    
    func incrementCounter() {
        counter += 1
        print("Counter incremented to: \(counter)")
        if counter == standard {
            let now = Date()
            print(now.timeIntervalSince(time))
        }
    }
    
    func performAsyncWork(id: Int) async {
        queue.sync {
            print("Starting work: \(id)")
            incrementCounter()
            print("Finished work: \(id)")
        }
    }
    
    func rewriteWork(id: Int) {
        print("rewrite: \(id)")
    }
}

class LockTest {
    var counter: Int = 0
    let lock = NSLock()
    
    func incrementCounter() {
        counter += 1
        print("Counter incremented to: \(counter)")
        if counter == standard {
            let now = Date()
            print(now.timeIntervalSince(time))
        }
    }
    
    func performAsyncWork(id: Int) {
        lock.lock()
        print("Starting work: \(id)")
        incrementCounter()
        print("Finished work: \(id)")
        lock.unlock()
    }
    
    func rewriteWork(id: Int) {
        print("rewrite: \(id)")
    }
}

// MARK: - Actor

let myActor = MyActor()

func actor(count: Int) {
    for i in 0..<count {
        Task {
            print("\(i)th start: ",Thread.current)
            await myActor.performAsyncWork(id: i)
            print("\(i)th end: ",Thread.current)
        }
    }
}

// MARK: - Serial Queue

let serial = SerialQueue()
let serialAsync = SerialAsyncQueue()

func serialGCD(count: Int) {
    for i in 0..<count {
        DispatchQueue.global().async {
            print("\(i)th start: ",Thread.current)
            serial.performAsyncWork(id: i)
            print("\(i)th end: ",Thread.current)
        }
    }
}

func serialAsync(count: Int) {
    for i in 0..<count {
        Task {
            print("\(i)th start: ",Thread.current)
            await serialAsync.performAsyncWork(id: i)
            print("\(i)th end: ",Thread.current)
        }
    }
}

// MARK: - NSLock

let lock = LockTest()

func lockWithGCD(count: Int) {
    for i in 0..<count {
        DispatchQueue.global().async {
            print("\(i)th start: ",Thread.current)
            lock.performAsyncWork(id: i)
            print("\(i)th end: ",Thread.current)
        }
    }
}

func lockWithConcurrecny(count: Int) {
    for i in 0..<count {
        Task.detached {
            print("\(i)th start: ",Thread.current)
            await lock.performAsyncWork(id: i)
            print("\(i)th end: ",Thread.current)
        }
    }
}

// Execution

standard = 50000
//actor(count: standard)
//serialGCD(count: standard)
serialAsync(count: standard)
//lockWithGCD(count: standard)
//lockWithConcurrecny(count: standard)

RunLoop.main.run(until: .now.addingTimeInterval(1000))
