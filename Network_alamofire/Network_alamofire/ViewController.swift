//
//  ViewController.swift
//  seminarpractice
//
//  Created by Junho Lee on 2021/10/30.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var userStorageLabel: UILabel!
    @IBOutlet weak var c: UILabel!
    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var e: UILabel!
    @IBOutlet weak var f: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getUserData()
    }
}

extension ViewController {
    
    func getUserData() {
        UserSignService.shared.readUserData(bookId: 1) { responseData in
            switch responseData {
            case .success(let BookInfoResponse):
                guard let response = BookInfoResponse as?
                        DetailResponseData else {return}
                if let userData = response.data {
                    self.authorLabel.text = userData.bookInfoList.author
                    self.authorLabel.sizeToFit()
                    self.userStorageLabel.text = userData.bookInfoList.userStorage
                    self.userStorageLabel.sizeToFit()
                    self.c.text = userData.bookInfoList.bookInfoListDescription
                    self.c.sizeToFit()
                    self.d.text = userData.bookInfoList.bookName
                    self.d.sizeToFit()
                    self.e.text = userData.bookInfoList.category
                    self.e.sizeToFit()
                    self.f.text = String(userData.bookInfoList.reviewPoint)
                    self.f.sizeToFit()
                }
            case .requestErr(let msg):
                print("requestErr \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
