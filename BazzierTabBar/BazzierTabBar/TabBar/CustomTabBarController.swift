//
//  CustomTabBarController.swift
//  BazzierTabBar
//
//  Created by Junho Lee on 2022/09/14.
//

import UIKit

class CustomTabBarController: UITabBarController {

    private let bottomSafeArea: CGFloat = 34.0
    private let tabBarHeight: CGFloat = 70.0
    
    public let customTabBar = CustomTabBar()
    
    override var selectedIndex: Int {
        didSet {
            self.customTabBar.select(at: selectedIndex, notifyDelegate: false)
        }
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            self.customTabBar.select(at: selectedIndex, notifyDelegate: false)
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setTabBar()
    }
}

// MARK: - UI & Layout

extension CustomTabBarController {
    
    private func setUI() {
        self.tabBar.isHidden = true
        setMiddleButton()
    }
    
    private func setLayout() {
        self.view.addSubview(customTabBar)
        
        customTabBar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(self.tabBarHeight + self.bottomSafeArea)
        }
    }
}

// MARK: - Methods

extension CustomTabBarController {
    private func setTabBar() {
        self.customTabBar.select(at: selectedIndex)
        self.customTabBar.delegate = self
    }
    
    func setMiddleButton() {

        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-28, y: -28, width: 56, height: 56))
        middleBtn.backgroundColor = .blue
        middleBtn.layer.cornerRadius = 28
        
        self.customTabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

        self.view.layoutIfNeeded()
    }

    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 1   //to select the middle tab. use "1" if you have only 3 tabs.
    }
}

extension CustomTabBarController: CustomTabBarDelegate {
    func customTabBar(_ sender: CustomTabBar, didSelectItemAt index: Int) {
        self.selectedIndex = index
    }
}
