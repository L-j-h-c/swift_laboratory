//
//  ViewController.swift
//  MultipleCore
//
//  Created by Junho Lee on 2022/09/18.
//

import UIKit

import MutipleSub

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc = CustomViewController()
        vc.hello()
    }


}

