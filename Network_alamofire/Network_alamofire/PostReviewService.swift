//
//  ReviewLikeService.swift
//  Network_alamofire
//
//  Created by Junho Lee on 2021/11/28.
//

import Foundation
import Alamofire

struct PostReviewService{
    static let shared = PostReviewService()
        
    func makeReviewService(content: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.postReviewURL
        let header: HTTPHeaders = [
            "content-Type" : "application/json"
            ]
        let params : Parameters = [
            "content" : content
        ]
        print("1")
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: params,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        print("2")
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                print("3")
                let networkResult = self.judgeGetInfoStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeGetInfoStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200:
            print("100")
            return isValidInfoData(data: data)
        case 400:
            print("4")
            return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidInfoData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        print("5")
        guard let decodeData = try? decoder.decode(postReviewResponseData.self, from: data)
        else {return .pathErr}
        return .success(decodeData)
    }
}
