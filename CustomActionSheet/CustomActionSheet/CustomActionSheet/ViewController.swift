//
//  ViewController.swift
//  CustomActionSheet
//
//  Created by Junho Lee on 2022/02/17.
//

import UIKit

class ViewController: UIViewController {
    
    let customAction = SparkActionSheet()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return backgroundView
    }()
    
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureDidRecognize(_:)))
    
    @IBAction func presentActionSheet(_ sender: Any) {
        present(customAction, animated: true)
    }
    
    private func setUI() {
        view.backgroundColor = .systemPurple
        
        lazy var cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
        cancelButton.setTitleColor(.red, for: UIControl.State())
        cancelButton.setTitle("cancelView", for: UIControl.State())
        cancelButton.isUserInteractionEnabled = true
        cancelButton.addGestureRecognizer(tapRecognizer)
        cancelButton.addTarget(self, action: #selector(tapGestureDidRecogniz), for: .touchUpInside)
        cancelButton.isEnabled = true
        view.addSubview(cancelButton)
    }
    
    private func setLayout() {
        
    }
    
    @objc func tapGestureDidRecognize(_ gesture: UITapGestureRecognizer) {
        print("hi")
//        self.dismiss(animated: true)
    }
    
    @objc func tapGestureDidRecogniz() {
        print("hi")
//        self.dismiss(animated: true)
    }
}

