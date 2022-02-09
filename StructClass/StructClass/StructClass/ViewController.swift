//
//  ViewController.swift
//  StructClass
//
//  Created by Junho Lee on 2022/02/07.
//

import UIKit


struct Member {
    var name: String
    var age: Int
}

class Food {
    var price: Int = 0
    var weight: Float = 0.0
    
    deinit {
        print("Food 클래스의 인스턴스가 소멸됩니다.")
    }
}

class ViewController: UIViewController {

    // 초기화 이후 프로퍼티에 접근하여 수정 가능
    var firstMember: Member = Member(name: "Duno", age: 25)
    let secondMember: Member = Member(name: "Hero", age: 25)
    
    var kimchi: Food? = Food()
    let potato: Food = Food()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setProperties()
    }

    func setProperties() {
        firstMember.name = "Ted"
        firstMember.age = 12
        
//        // 아래는 let으로 선언하였기에 오류가 발생한다.
//        secondMember.name = "Ted"
//        secondMember.age = 12
        
        kimchi?.price = 2500
        kimchi?.weight = 500
        
        // 구조체와 다르게 let으로 선언해도 프로퍼티 값 수정 가능
        potato.price = 2500
        potato.weight = 500
        
        kimchi = nil
    }
}
