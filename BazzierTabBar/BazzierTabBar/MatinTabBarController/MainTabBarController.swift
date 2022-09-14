//
//  MainTabBarController.swift
//  BazzierTabBar
//
//  Created by Junho Lee on 2022/09/14.
//

import UIKit

class MainTabBarController: CustomTabBarController {
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.setTabBar()
        }
    }
}

// MARK: - Methods

extension MainTabBarController {
    private func setTabBar() {
        let feedVC = UIViewController()
        feedVC.view.backgroundColor = .gray
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .cyan
        let plusVC = UIViewController()
        plusVC.view.backgroundColor = .red
        
        feedVC.tabBarItem = UITabBarItem(title: "피드", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "circle"), selectedImage: UIImage(systemName: "circle.fill"))
        
        let homeNVC = UINavigationController(rootViewController: homeVC)
        homeNVC.isNavigationBarHidden = true
        
        let feedNVC = UINavigationController(rootViewController: feedVC)
        feedNVC.isNavigationBarHidden = true
        
        setViewControllers([feedNVC, plusVC, homeNVC], animated: false)
        
        // set customTabBar.
        if let items = self.tabBar.items {
            self.customTabBar.add(items: items)
        }
        self.customTabBar.tintColor = .blue
        
        self.selectedIndex = 1
    }
}

