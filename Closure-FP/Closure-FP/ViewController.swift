//
//  ViewController.swift
//  Closure-FP
//
//  Created by Junho Lee on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {

    let names: [String] = ["말", "개", "원숭이", "고양이"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortNameByFunction()
        sortNameByPostClosure()
    }

    func backwards(first: String, second: String) -> Bool {
        return first > second
    }
    
    func sortNameByFunction() {
        let sortedNames = names.sorted(by: backwards(first:second:))
        print(names)
        print("----정렬된 결과----")
        print(sortedNames)
    }
    
    func sortNameByPostClosure() {
        let sortedNames = names.sorted() { (first: String, second: String) -> Bool in
            return first > second
        }
    }
    
    func sortNameByShortClosure() {
        let sortedNames = names.sorted { (first: String, second: String) -> Bool in
            return first > second
        }
    }
    
    func sortNameByNoReturn() {
        let sortedNames = names.sorted { (first, second) in
            return first > second
        }
    }
    
    func sortNameByNoParams() {
        let sortedNames = names.sorted {
            return $0 > $1
        }
    }
}
