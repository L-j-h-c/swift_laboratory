//
//  main.swift
//  actorTest
//
//  Created by Junho Lee on 2023/04/08.
//

import Foundation

let time = Date()
var standard = 0.0

class MyClass {
    var counter: Double = 0.0
    
    func incrementCounter() {
        counter += 1.2
    }
    
    func performAsyncWork(id: Int) async {
        incrementCounter()
    }
}

actor MyActor {
    var counter: Double = 0.0
    
    func incrementCounter() {
        counter += 1.2
    }
    
    func performAsyncWork(id: Int) async {
        incrementCounter()
    }
}

class SerialQueue {
    var counter: Double = 0.0
    let queue = DispatchQueue(label: "serial")
    
    func incrementCounter() {
        counter += 1.2
        print("Counter incremented to: \(counter)")
    }
    
    func performAsyncWork(id: Int) {
        queue.sync {
            print("Starting work: \(id)")
            incrementCounter()
            print("Finished work: \(id)")
        }
    }
}

class SerialAsyncQueue {
    let queue = DispatchQueue(label: "serial", attributes: .concurrent)
    var _counter: Double = 0.0
    var counter: Double {
        get {
            queue.sync {
                return _counter
            }
        }
    }
    
    func incrementCounter() {
        _counter += 1.2
        print("Counter incremented to: \(_counter)")
    }
    
    func performAsyncWork(id: Int) async {
        queue.sync {
            print("Starting work: \(id)")
            self.incrementCounter()
            print("Finished work: \(id)")
        }
    }
}

public class SerialAsyncBarrierQueue {
    let queue = DispatchQueue(label: "serial", attributes: .concurrent)
    var _counter: Double = 0.0
    var counter: Double {
        get {
            queue.sync {
                return _counter
            }
        }
    }
    
    func incrementCounter() {
        _counter += 1.2
        print("Counter incremented to: \(_counter)")
    }
    
    func performAsyncWork(id: Int) async {
        queue.async(flags: .barrier) {
            print("Starting work: \(id)")
            self.incrementCounter()
            print("Finished work: \(id)")
        }
    }
}

public class LockTest {
    let lock = NSLock()
    var counter: Double = 0.0
    
    func incrementCounter() {
        counter += 1.2
    }
    
    func performAsyncWork(id: Int) {
        lock.lock()
        incrementCounter()
        lock.unlock()
    }
}

// MARK: - Actor

let myClass = MyClass()
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

func classAsync(count: Int) {
    for i in 0..<count {
        Task {
            print("\(i)th start: ",Thread.current)
            await myClass.performAsyncWork(id: i)
            print("\(i)th end: ",Thread.current)
        }
    }
}

// MARK: - Serial Queue

let serial = SerialQueue()
let serialAsync = SerialAsyncQueue()
let serialAsyncBarrier = SerialAsyncBarrierQueue()

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
        for j in 0..<10 {
            Task {
                let a = serialAsync.counter
                print(a)
            }
        }
    }
}

func serialAsyncBarrier(count: Int) {
    for i in 0..<count {
        Task {
            print("\(i)th start: ",Thread.current)
            await serialAsyncBarrier.performAsyncWork(id: i)
            print("\(i)th end: ",Thread.current)
        }
        for j in 0..<10 {
            Task {
                let a = serialAsyncBarrier.counter
                print(a)
            }
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

//standard = 30000
let count = Int(standard / 1.19)
//actor(count: count)
//classAsync(count: count)
//serialGCD(count: count)
//serialAsync(count: count)
//serialAsyncBarrier(count: count)
//lockWithGCD(count: count)
//lockWithConcurrecny(count: count)
