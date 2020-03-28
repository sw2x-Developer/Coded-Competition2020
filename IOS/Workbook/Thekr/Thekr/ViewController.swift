//
//  ViewController.swift
//  Thekr
//
//  Created by Sw2x on 3/27/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    var arrayofbuttons: [UIButton] = []
    var counter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrayofbuttons = [self.B1 , self.B2 , self.B3 , self.B4]
        
         Questions.init(question: "Question 1", answearsarray: ["Answear 1" , "Answear 2" , "Answear 3" ,  "Answear 4"], answear: .two)
        Questions.init(question: "Question 2", answearsarray: ["Answear 1" , "Answear 2" , "Answear 3" ,  "Answear 4"], answear: .one)
         Questions.init(question: "Question 3", answearsarray: ["Answear 1" , "Answear 2" , "Answear 3" ,  "Answear 4"], answear: .three)
        Questions.init(question: "Question 4", answearsarray: ["Answear 1" , "Answear 2" , "Answear 3" ,  "Answear 4"], answear: .four)
        
        showQuestion(which: counter)
        
        
    }

    func showQuestion(which: Int){
        if which > (allQuestions.count - 1) {
            print("No more questions")
            for i in 0 ..< self.arrayofbuttons.count {
                self.arrayofbuttons[i].isUserInteractionEnabled = false
            }
        }else{
            let Question: Questions = allQuestions[which]
            DispatchQueue.main.async {
                self.QuestionLabel.text = Question.question
                for i in 0 ..< self.arrayofbuttons.count {
                    self.arrayofbuttons[i].setTitle(Question.answearsarray[i], for: .normal)
                }
            }
        }
    }
    

    @IBAction func Buttons(_ sender: UIButton) {
        if(sender.tag == allQuestions[counter].answear.rawValue){
            counter += 1
            showQuestion(which: counter)
        }else{
            print("Wrong")
        }
    }
    
    
    
}

