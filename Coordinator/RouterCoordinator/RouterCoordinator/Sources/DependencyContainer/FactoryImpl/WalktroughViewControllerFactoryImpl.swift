//
//  WalktroughViewControllerFactoryImpl.swift
//  RouterCoordinator
//
//  Created by Junho Lee on 2022/09/29.
//

import UIKit

extension DependencyContainer: WalktroughViewControllerFactory {

    func instantiateWalktroughViewController() -> WalktroughViewController {
        let walktroughViewController = UIStoryboard.walktrough.instantiateViewController(withIdentifier: "WalktroughViewController") as! WalktroughViewController
        walktroughViewController.viewModel = WalktroughViewModel()
        return walktroughViewController
    }
    
}
