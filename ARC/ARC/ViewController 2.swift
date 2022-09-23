//
//  ViewController.swift
//  ARC
//
//  Created by Junho Lee on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

    var reference1: Person?
    var reference2: Person?
    var reference3: Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func initiating() {
        //reference1의 참조 횟수가 하나씩 감소하는 예제
        reference1 = Person(name: "John Appleseed")
        reference2 = reference1
        reference3 = reference1
        
        reference3 = nil
        reference2 = nil
        reference1 = nil
    }
    
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
