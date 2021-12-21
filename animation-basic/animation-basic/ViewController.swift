//
//  ViewController.swift
//  animation-basic
//
//  Created by Junho Lee on 2021/12/21.
//

import UIKit
import Lottie

class ViewController: UIViewController {

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
    @IBOutlet weak var firstUIView: UIView!
    @IBOutlet weak var secondUIView: UIView!
    @IBOutlet weak var thirdUIView: UIView!
    @IBOutlet weak var fourthUIView: UIView!
    @IBOutlet weak var fifthUIView: UIView!
    
    var animation: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstAnimation()
        secondAnimation()

    }
    
    func firstAnimation() {
        // 방법1: 애니메이션 즉시실행
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: [.repeat]) { self.firstUIView.frame = .init(x: 100, y: 300, width: 150, height: 200) }
        
        // 방법2: startAnimation() 호출
        let animation = UIViewPropertyAnimator(duration: 3, curve: .easeInOut) { self.secondUIView.frame = .init(x: 100, y: 300, width: 150, height: 200)
        };
        animation.addAnimations({
            
        }, delayFactor: 1)
        animation.addAnimations {
            self.secondUIView.frame = .init(x: 0, y: 0, width: 150, height: 200)
        animation.startAnimation()
        }
        
        animation.startAnimation()
    }
    
    func secondAnimation() {
        animation = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) { self.thirdUIView.frame = .init(x: 100, y: 300, width: 150, height: 200) }
        guard let animation = animation else { return }
        animation.addAnimations { self.thirdUIView.frame = .init(x: 100, y: 500, width: 150, height: 200) }
        animation.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { animation.isReversed = true }
        
    }
}

