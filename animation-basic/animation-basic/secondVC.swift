//
//  secondVC.swift
//  animation-basic
//
//  Created by Junho Lee on 2021/12/21.
//

import UIKit
import Lottie

class secondVC: UIViewController {

    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "snowman")
        animationView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: 300,
                                     height: 300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lottieView)
        lottieView.isHidden=false
        lottieView.play()
    }

}
