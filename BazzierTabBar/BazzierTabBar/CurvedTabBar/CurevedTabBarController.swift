//
//  CurevedTabBarController.swift
//  BazzierTabBar
//
//  Created by Junho Lee on 2022/09/14.
//

import UIKit

class CurevedTabBarController: UITabBarController, UITabBarControllerDelegate {

    let curvedTabbar = CurvedTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setDelegate()
    }
}

extension CurevedTabBarController {
    private func setTabBar() {
        self.tabBar
    }
    
    private func setDelegate() {
        self.delegate = self
    }
}
