//
//  SparkAlert.swift
//  CustomActionSheet
//
//  Created by Junho Lee on 2022/02/22.
//

import Foundation
import UIKit

import SnapKit

class SparkActionSheet: UIViewController {
    
    lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return backgroundView
    }()
    
    lazy var tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureDidRecognize(_:)))
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        setUI()
//        setLayout()
//    }
    
    override init(nibName nibNameOrNil: String?,
                  bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setUI()
        setLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
        backgroundView.frame = view.bounds
        backgroundView.isUserInteractionEnabled = true
        backgroundView.addGestureRecognizer(tapRecognizer)
        view.addSubview(backgroundView)
        
        lazy var cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
        cancelButton.setTitleColor(.red, for: UIControl.State())
        cancelButton.setTitle("cancelView", for: UIControl.State())
        cancelButton.isUserInteractionEnabled = true
        cancelButton.addTarget(self, action: #selector(tapGestureDidRecogniz), for: .touchUpInside)
        cancelButton.isEnabled = true
        view.addSubview(cancelButton)
    }
    
    private func setLayout() {
        
    }
    
    @objc func tapGestureDidRecognize(_ gesture: UITapGestureRecognizer) {
        print("hi")
        self.dismiss(animated: true)
    }
    
    @objc func tapGestureDidRecogniz() {
        print("hi")
        self.dismiss(animated: true)
    }
    
}
