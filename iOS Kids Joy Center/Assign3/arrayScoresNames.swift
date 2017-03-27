//
//  arrayScoresNames.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/27/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class arrayScoresNames: NSObject {

    static var arraySave = [highScores]()

    struct highScores {
        var scoresStruct: Int = 0
        var nameOfGameStruct: String = " "
        var difficultyHighStruct: String = " "
    }
   
}
