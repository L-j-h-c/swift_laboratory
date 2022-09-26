//
//  TopRatedCoordinator.swift
//  Coordinator
//
//  Created by Junho Lee on 2022/09/24.
//

import UIKit

import BasicCoordinator

protocol TopRatedFlow: class {
    func coordinateToDetail()
}

class TopRatedCoordinator: Coordinator, TopRatedFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRatedViewController = TopRatedViewController()
        topRatedViewController.coordinator = self
        
        navigationController?.pushViewController(topRatedViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    func coordinateToDetail() {
        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
        coordinate(to: topRatedDetailCoordinator)
    }
}
