//
//  Counter.swift
//  Concurrency
//
//  Created by Junho Lee on 2023/05/11.
//

import Foundation

import Swift

actor Counter {
    private(set) var value = 0

    func increment() {
        value += 1
    }
}
