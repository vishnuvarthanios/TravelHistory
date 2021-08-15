//
//  Service.swift
//  TravelHistory
//
//  Created by Vishnuvarthan Deivendiran on 15/08/21.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias StatusServiceResponse = (Bool, String, JSON) -> Void

class BaseService {
    
    func serviceGETRequest(path: String , stoploader : Bool = false,onCompletion: @escaping StatusServiceResponse) throws {
        let url = try path.asURL()

        Alamofire.request(url).responseJSON { response in
            print(response.result.value as Any)
            switch response.result
            {
            case .success:
                if let value = response.result.value {
                    onCompletion(true, JSON(value)["message"].stringValue, JSON(value))
                }
            case .failure:
                let statusCode = response.response?.statusCode
                let fail: NSDictionary?
                var message = ""
                if statusCode == 404 {
                    fail =  ["reason": "\(ServerNotFoundMessage)"]
                    message = ServerNotFoundMessage
                } else {
                    fail =  ["reason": "\(ServerResponseFailureMessage):\(String(describing: statusCode))" as Any]
                    message = ServerResponseFailureMessage
                }
                onCompletion(false, "\(message)", JSON(fail!))
            }
        }
    }
}
