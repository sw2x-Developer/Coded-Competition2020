//
//  FileQuestions.swift
//  Thekr
//
//  Created by Sw2x on 3/27/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import Foundation


public var allQuestions: [Questions] = []

public class Questions {
    
    
    var question: String
    var answearsarray: [String]
    var answear: Answears
    
    init(question: String , answearsarray: [String] , answear: Answears) {
        self.question = question
        self.answear = answear
        self.answearsarray = answearsarray
        allQuestions.append(self)
    }
    
    
}

enum Answears:Int {
    case one = 1,
     two = 2,
     three = 3,
     four = 4
}
