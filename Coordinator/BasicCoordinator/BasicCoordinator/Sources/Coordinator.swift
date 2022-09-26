//
//  Coordinator.swift
//  
//
//  Created by Junho Lee on 2022/09/24.
//

import Foundation

import UIKit

public protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

public extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
