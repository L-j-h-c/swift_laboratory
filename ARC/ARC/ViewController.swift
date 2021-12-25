//
//  ViewController.swift
//  ARC
//
//  Created by Junho Lee on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var reference1: Person?
    var reference2: Person?
    var reference3: Person?
    
    reference1 = Person(name: "John Appleseed")
    
    reference2 = nil
}

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit{
        print("\(name) is being deinitialized")
    }
}
