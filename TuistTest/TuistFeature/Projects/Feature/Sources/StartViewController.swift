//
//  StartViewController.swift
//  Feature
//
//  Created by Junho Lee on 2022/09/18.
//  Copyright © 2022 seolagirTuist. All rights reserved.
//

import UIKit
import DesignSystem

public class StartViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = CustomViewController()
        vc.hello()

        // Do any additional setup after loading the view.
    }

}
