//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Junho Lee on 2022/07/01.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    private let animationView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let animationLabel: UILabel = {
        let lb = UILabel(frame: CGRect(x: 200, y: 500, width: 120, height: 30))
        lb.textColor = .blue
        lb.text = "애니메이션 라벨"
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setAnimation()
        setTextLayer()
    }
    
    private func setLayout() {
        view.addSubview(animationView)
        view.addSubview(animationLabel)
        
        animationView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    private func setAnimation() {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0
        opacityAnimation.toValue = 1
        opacityAnimation.duration = 0.5
        opacityAnimation.repeatCount = .infinity
        
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = [0, 0]
        positionAnimation.toValue = [300, 300]
        
        let roundTripPositionAnimation = CAKeyframeAnimation(keyPath: "position.y")
        roundTripPositionAnimation.values = [0, UIScreen.main.bounds.height-50, 0]
        roundTripPositionAnimation.keyTimes = [0, 0.5, 1]
        roundTripPositionAnimation.isAdditive = true
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 2
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Float.pi * 2.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 5
        animationGroup.repeatCount = .infinity
        animationGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animationGroup.animations = [scaleAnimation, opacityAnimation, roundTripPositionAnimation, rotationAnimation]
        
        animationView.layer.add(animationGroup, forKey: "position")
    }
    }


}

