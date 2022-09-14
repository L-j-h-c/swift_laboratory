//
//  CustomTabBarItem.swift
//  BazzierTabBar
//
//  Created by Junho Lee on 2022/09/14.
//

import UIKit

import SnapKit

final class CustomTabBarItem: UIView {
    
    // MARK: - Properties
    
    private var imageView = UIImageView()
    private var titleLable = UILabel()
    
    var isSelected = false {
        didSet {
            reloadAppearnce()
        }
    }
    
    var selectedColor: UIColor = .black {
        didSet {
            reloadAppearnce()
        }
    }
    
    var deselectedColor: UIColor = .black {
        didSet {
            reloadAppearnce()
        }
    }
    
    // MARK: - Initializer
    
    init(forItem item: UITabBarItem) {
        // set button size to 48*48.
        super.init(frame: CGRect(x: 0, y: 0, width: 28, height: 48))
    
        setUI()
        setItem(image: item.image, title: item.title)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    /// Set UI.
    private func setUI() {
        self.backgroundColor = .clear
        self.imageView.contentMode = .scaleAspectFill
        
        titleLable.font = UIFont.systemFont(ofSize: 8)
    }
    
    private func setItem(image: UIImage?, title: String?) {
        if let image = image, let title = title {
            imageView.image = image.withRenderingMode(.alwaysTemplate)
            titleLable.text = title
        }
    }
    
    private func reloadAppearnce() {
        self.tintColor = isSelected ? selectedColor : deselectedColor
        self.titleLable.textColor = isSelected ? selectedColor : deselectedColor
    }
    
    func itemIsSelected() {
        isSelected = isSelected ? true : false
    }
    
    // MARK: - Layout
    
    /// Set layout.
    private func setLayout() {
        self.addSubview(imageView)
        self.addSubview(titleLable)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.leading.trailing.equalToSuperview()
            $0.width.height.equalTo(28)
        }
        
        titleLable.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(1)
            $0.bottom.equalToSuperview()
            $0.centerX.equalTo(imageView.snp.centerX)
        }
    }
}

