//
//  AppCoordinator.swift
//  ReactiveCoordinator
//
//  Created by Junho Lee on 2022/09/29.
//

import UIKit

import RxSwift

class AppCoordinator: ReactiveCoordinator<Void> {
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        
        let navigationController = UINavigationController(rootViewController: HolidaysViewController())
        
        let holidaysCoordinator = HolidaysCoordinator(rootViewController: navigationController.viewControllers[0])
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return coordinate(to: holidaysCoordinator)
    }
}
