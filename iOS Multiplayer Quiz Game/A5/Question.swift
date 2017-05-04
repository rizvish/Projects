//
//  Question.swift
//  A5
//
//  Created by Zachary Kimpfler on 4/26/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class Question: NSObject {
    
    var correctOption = 0
    var number = 0
    var options = [String]()
    var questionSentence = String()
    
    init(object: [String : Any]){
        if let correctOptionLetter = object["correctOption"] as? String {
            switch correctOptionLetter {
            case "A":
                correctOption = 0
            case "B":
                correctOption = 1
            case "C":
                correctOption = 2
            case "D":
                correctOption = 3
            default:
                correctOption = 0
            }
        }
        if let numberGivenInt = object["number"] as? Int {
            number = numberGivenInt
            
        }
        if let optionsDic = object["options"] as? [String : String] {
            //Getting option A
            
                if let option1 = optionsDic["A"] {
                    options.append(option1)
                }
            
            //Getting option B
            
                if let option2 = optionsDic["B"] {
                    options.append(option2)
                }
            
            //Getting option C
            
                if let option3 = optionsDic["C"] {
                    options.append(option3)
                }
            
            //Getting option D
            
                if let option4 = optionsDic["D"] {
                    options.append(option4)
                }
            
            
        }
        if let questionSentenceString = object["questionSentence"] as? String {
            questionSentence = questionSentenceString
        }
        
    }

}
