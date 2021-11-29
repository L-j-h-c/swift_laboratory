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
    @IBOutlet weak var putResponseLabel: UILabel!
    
    @IBOutlet weak var likeCount: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var postReviewContent: UILabel!
    @IBOutlet weak var postReviewId: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getUserData()
    }
    
    
    @IBAction func likeCountButton(_ sender: Any) {
        putLikeCount()
    }
    
    @IBAction func postReviewButton(_ sender: Any) {
        postReview()
    }
    
    public var updateCount : Int = 0 {
        didSet {
            getUserData()
            print("1")
        }
    }
    
    public var updateReview : Int = 0 {
        didSet {
            print("2")
        }
    }
    
    public var bookNumber : Int = 1
    
    public var reviewIdForGet : Int = 0
}

extension ViewController {
    
    func getUserData() {
        UserSignService.shared.readUserData(bookId: bookNumber) { responseData in
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
                    self.likeCount.text = String(userData.reviewList[self.bookNumber-1].likeCount)
                    self.likeCount.sizeToFit()
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
    
    func putLikeCount() {
        ReviewLikeService.shared.putLikeCount(reviewId: 1) { responseData in
            switch responseData {
            case .success(let reviewCountResponse):
                guard let response = reviewCountResponse as?
                        likeCountResponseData else {return}
                self.updateCount += 1
                self.putResponseLabel.text = response.message
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
    
    func postReview() {
        PostReviewService.shared.makeReviewService(content: textField.text ?? "") { responseData in
            switch responseData {
            case .success(let postReviewResponse):
                guard let response = postReviewResponse as?
                        postReviewResponseData else {return}
                print("7")
                if let reviewData = response.data {
                    self.postReviewContent.text = "reviewId = \(reviewData.reviewID)"
                    self.reviewIdForGet = reviewData.reviewID
                    self.updateReview += 1
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
