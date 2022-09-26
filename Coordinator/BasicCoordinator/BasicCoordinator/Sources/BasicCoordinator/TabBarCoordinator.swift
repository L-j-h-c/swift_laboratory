//
//  TabBarCoordinator.swift
//  Coordinator
//
//  Created by Junho Lee on 2022/09/24.
//

import UIKit

import BasicCoordinator

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let topRatedNavigationController = UINavigationController()
        topRatedNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let topRatedCoordinator = TopRatedCoordinator(navigationController: topRatedNavigationController)
        
//        let searchNavigationController = UINavigationController()
//        searchNavigationController.tabBarItem = UITabBarItem(
//            tabBarSystemItem: .search, tag: 1)
//        let searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)
//
//        let historyNavigationController = UINavigationController()
//        historyNavigationController.tabBarItem = UITabBarItem(
//            tabBarSystemItem: .history, tag: 2)
//        let historyCoordinator = HistoryCoordinator(navigationController: historyNavigationController)
        
        tabBarController.viewControllers = [topRatedNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        coordinate(to: topRatedCoordinator)
//        coordinate(to: searchCoordinator)
//        coordinate(to: historyCoordinator)
    }

}
