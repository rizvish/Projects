//
//  Utility.swift
//  A5
//
//  Created by Zachary Kimpfler on 4/26/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit
import Alamofire

class Utility: NSObject {
    
    static let shared = Utility()
    
    func downloadQuizDataWith(pageNumber: Int, completion: @escaping (_ questions: [Question]?, _ error: Error?) -> Void) {
        let url = "http://www.people.vcu.edu/~ebulut/jsonFiles/quiz\(pageNumber).json"
        
        let request = Alamofire.request(url)
        let status = request.response?.statusCode

        if status == 404 {
            numberOfRestarts = 1
            print("url code not found in server")
        }
  
        request.responseJSON { (response) in
            debugPrint(response)
            if let questions = (response.value as? [String : Any])?["questions"] as? [[String : Any]] {
                var questionArray = [Question]()
                for aQuestion in questions {
                    questionArray.append(Question(object: aQuestion))
                }
                questionArray = questionArray.sorted(by: { (q1, q2) -> Bool in
                    return q1.number > q2.number
                })
                completion(questionArray, nil)
            }
            else {
                completion(nil, response.error)
            }
        }
    }

}
