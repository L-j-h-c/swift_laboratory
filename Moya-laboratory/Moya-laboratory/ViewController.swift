//
//  ViewController.swift
//  Moya-laboratory
//
//  Created by Junho Lee on 2021/12/02.
//

import UIKit
import Moya

class ViewController: UIViewController {

    private let service = MoyaProvider<HomeService>()
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToSignUp(_ sender: Any) {
        getItemData()
    }
    func getItemData() {
        print("4")
        service.request(.signUp(email: emailTF.text ?? "", name: nameTF.text ?? "", password: passwordTF.text ?? "")) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    //                    self?.itemData = try result.map(HomeItem.self)
                    //                    self?.itemList = self?.itemData?.data ?? []
                    //                    print("itemList", self?.itemList ?? [])
                    print("5")
                    let data = try result.map(LoginResponseData.self)
                    print(data)
                    let resultData = data.data
                    self?.messageLabel.text = data.message
                    self?.responseLabel.text = resultData?.name
                    
                } catch(let err) {
                    print("6")
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print("7")
                print(err.localizedDescription)
            }
            
        }
    }
}
