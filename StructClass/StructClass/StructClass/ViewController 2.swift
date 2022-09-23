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
    
    // 아래는 클래스가 참조 타입임을 확인하기 위한 인스턴스 선언
    var tomato: Food? = Food()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setProperties()
        checkReference()
        
        changeMemberAge(firstMember)
        print("firstMember의 나이 : \(firstMember.age)")
        
        changeFoodPrice(tomato ?? Food())
        print("tomato의 가격 : \(tomato!.price)")
        
        useIdentifyOperator()
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
    
    func checkReference() {
        var apple: Food = Food()
        var pineapple: Food = apple
        
        print("apple의 가격 : \(apple.price)")
        print("pineapple의 가격 : \(pineapple.price)")
        
        pineapple.price = 200
        print("바뀐 apple의 가격 : \(apple.price)")
        print("바뀐 pineapple의 가격 : \(pineapple.price)")
    }
    
    func changeMemberAge(_ member: Member) {
        var targetMember: Member = member
        targetMember.age = 15
    }
    
    func changeFoodPrice(_ food: Food) {
        food.price = 300
    }
    
    func useIdentifyOperator() {
        var apple: Food = Food()
        var pineapple: Food = apple
        var tomato: Food = Food()

        print(apple === pineapple)
        print(apple === tomato)
        print(apple !== tomato)
    }
}
