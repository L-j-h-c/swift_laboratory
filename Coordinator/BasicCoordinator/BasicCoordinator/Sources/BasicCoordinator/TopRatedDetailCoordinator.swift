//
//  TopRatedDetailCoordinator.swift
//  Coordinator
//
//  Created by Junho Lee on 2022/09/24.
//

import UIKit

import BasicCoordinator

protocol TopRatedDetailFlow {
    func dismissDetail()
}

class TopRatedDetailCoordinator: Coordinator, TopRatedDetailFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRatedDetailViewController = TopRatedDetailViewController()
        topRatedDetailViewController.coordinator = self
        
        navigationController.present(topRatedDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
