//
//  NetworkManager.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/24/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager{
    static let baseUrl = "https://staging.qosoor.sa/qosoor/api/v1"
    static let loginUrl = baseUrl + "/QLogin"
    
    static func login(id: String, password: String, completion: @escaping ((String, Bool)->Void)) {
        let url = URL(string: loginUrl)!
        var headers: [String: String] = [
            "Content-Type": "application/json",
            "Accecpt": "application/json"
        ]
        
        let body = ["id": id, "password": password]
        AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(headers)).validate().responseJSON { (response) in
            switch response.result {
            case .failure(let err):
                completion(err.localizedDescription, false)
            case .success(let value):
                completion("done", true)
            }

        }
    }
}
