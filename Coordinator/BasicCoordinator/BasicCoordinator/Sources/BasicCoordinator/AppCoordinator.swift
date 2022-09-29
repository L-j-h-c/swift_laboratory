//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Junho Lee on 2022/09/24.
//

import UIKit

open class AppCoordinator: Coordinator {
    let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
