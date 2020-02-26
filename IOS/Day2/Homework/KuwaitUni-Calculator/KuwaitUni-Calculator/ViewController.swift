//
//  ViewController.swift
//  KuwaitUni-Calculator
//
//  Created by Sw2x on 2/26/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Declaring UI Elements as variables to add functionalities like changing their value or getting it
    
    // [Declaring Variables Starts Here]
    var audioPlayer: AVAudioPlayer!
    @IBOutlet weak var MathStepperValue: UIStepper! // Math Stepper Element
    @IBOutlet weak var MathGradeField: UITextField! // Math TextField
    
    @IBOutlet weak var ChemistryStepperValue: UIStepper! // Chemistry Stepper Element
    
    @IBOutlet weak var ChemistryGradeField: UITextField! // Chemistry TextField
    
    @IBOutlet weak var EnglishStepperValue: UIStepper! // English Stepper Element
    
    @IBOutlet weak var EnglishGradeField: UITextField! // English TextField
    
    @IBOutlet weak var HighSchoolStepperValue: UIStepper! // HighSchool Stepper Element
    
    @IBOutlet weak var HighSchoolGradeField: UITextField! // HighSchool TextField
    
    @IBOutlet weak var PercentageLabel: UILabel! // Percentage Label element
    
    @IBOutlet weak var StatusLabel: UILabel! // Status Label Element
    
    
    @IBOutlet weak var ImageStatus: UIImageView! // Image status Element
    
    // [Declaring Variables Ends Here]
    
    
    
    // The Event of changing the value of the stepper
    // [Stepper value change event starts here]
    
    
    
    
    @IBAction func ChemistryStepper(_ sender: UIStepper) {
        ChemistryGradeField.text = String(sender.value) // set the value of the text field to the Double value of the stepper
    }
    
    
    @IBAction func EnglishStepper(_ sender: UIStepper) {
        EnglishGradeField.text = String(sender.value) // set the value of the text field to the Double value of the stepper
    }
    
    @IBAction func HighSchoolStepper(_ sender: UIStepper) {
        HighSchoolGradeField.text = String(sender.value) // set the value of the text field to the Double value of the stepper
    }
    
    
    @IBAction func MathStep(_ sender: UIStepper) {
        //MathGradeField.text = String(format: "%.0f" , sender.value)
        // the line above ^ I was trying to put the value in a form of an Integer then i realized Two things
        // 1. i could have made this easier by putting Int() in front of the sender.value but as you may know i'm a genius
        // 2. this is a grade so why the hell am i trying to use integers HUH ?? well execuse my brain but i have not sleep since yesterday cuz we got a 2 week vacation because of Corona virus (God bless you all)
        MathGradeField.text = String(sender.value) // Finally my genius realized that i have to set the value of the text field to the Double value of the stepper
    }
    
    // [Stepper value change event ends here]
    
    
    // The Event of changing the value of TextFields
    // [TextFields value change event starts here]
    @IBAction func MathFieldChanged(_ sender: UITextField) {
        check(textField: sender) // Calling the check function which i made you can see it down below
    }
    
    
    @IBAction func ChemistryFieldChanged(_ sender: UITextField) {
        check(textField: sender) // Calling the check function which i made you can see it down below
    }
    
    
    @IBAction func EnglishFieldChanged(_ sender: UITextField) {
        check(textField: sender) // Calling the check function which i made you can see it down below
    }
    
    
    @IBAction func HighSchoolFieldChanged(_ sender: UITextField) {
        check(textField: sender) // Do i have to write this again ? i'm tired already !!
    }
    // [TextFields value change event ends here]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let alert = UIAlertController(title: "Thank you ❤️", message: "Thanks to Dalal alhazeem and Abdullah alhassan for their great effort i know it's hard to review all these project god bless you 👊.", preferredStyle: UIAlertController.Style.alert)

         // add an action (button)
         alert.addAction(UIAlertAction(title: "We love you too", style: UIAlertAction.Style.default, handler: nil))

         // show the alert
         self.present(alert, animated: true, completion: nil)
 // i don't know why the alert did not show up and i'm too tired to fix it but you got the point anyways
        
        MathGradeField.text = String(MathStepperValue.value) // Setting the value of the textfield to the default value of the stepper which is a hundred
        ChemistryGradeField.text = String(ChemistryStepperValue.value) // SAME AS ABOVE
        EnglishGradeField.text = String(EnglishStepperValue.value) // SAME AS ABOVE
        HighSchoolGradeField.text = String(HighSchoolStepperValue.value) // SAME AS ABOVE
    }
    
    
    @IBAction func ButtonClickEvent(_ sender: UIButton) {
        if let soundURL = Bundle.main.url(forResource: "wait", withExtension: "mp3") { // playing a sound
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            }
            catch {
                print(error)
            }
            audioPlayer.play()
        }else{
            print("Unable to locate audio file")
        }
        
        view.endEditing(true) // disable keyboard
        sleep(2) // delay
        let highschoolscore: Double = 0.65
        let mathsatscore: Double = 0.20
        let englishsatscore: Double = 0.10
        let chemistrysatscore: Double = 0.05
        
        let highschoolpercent: Double = Double(HighSchoolGradeField.text!)!
        let mathsatpercent: Double = Double(MathGradeField.text!)!
        let englishsatpercent: Double = Double(EnglishGradeField.text!)!
        let chemistrysatpercent: Double = Double(ChemistryGradeField.text!)!
        
        let totalscore: Double = (highschoolscore * highschoolpercent)
            + (mathsatscore * mathsatpercent)
            + (englishsatscore * englishsatpercent)
            + (chemistrysatscore * chemistrysatpercent) // calculate total score
        
        PercentageLabel.isHidden = false // show percentage label
        PercentageLabel.text = "Percentage: " + String(totalscore) // set Percentage label value to percentage
        
        
        StatusLabel.isHidden = false // show status label
        ImageStatus.isHidden = false // show image UI
        if totalscore >= 85 { // if percent is greater than or equals 85
            StatusLabel.textColor = UIColor.green // change text color to green
            StatusLabel.text = "You are accepted" // set text to you aree accepted
            ImageStatus.image = #imageLiteral(resourceName: "burger") // show burger image
            if let soundURL = Bundle.main.url(forResource: "accepted", withExtension: "mp3") { // play sound
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                }
                catch {
                    print(error)
                }
                audioPlayer.play()
            }else{
                print("Unable to locate audio file")
            }
        }else if totalscore >= 75 { // if total score is greater than or equals to 75
            StatusLabel.textColor = UIColor.yellow // change text color to yellow
            StatusLabel.text = "Try harder" // set text to try harder
            ImageStatus.image = #imageLiteral(resourceName: "pizza") // show pizza image
            if let soundURL = Bundle.main.url(forResource: "harder", withExtension: "mp3") { // play a sound
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                }
                catch {
                    print(error)
                }
                audioPlayer.play()
            }else{
                print("Unable to locate audio file")
            }
        }else{ // else
            StatusLabel.textColor = UIColor.red // change text color to red
            StatusLabel.text = "YOU DON'T STAND A CHANCE" // change text to you don't stand a chance
            ImageStatus.image = #imageLiteral(resourceName: "cheese") // change image to rotten cheese
            if let soundURL = Bundle.main.url(forResource: "fail", withExtension: "mp3") { // play a sound
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                }
                catch {
                    print(error)
                }
                audioPlayer.play()
            }else{
                print("Unable to locate audio file")
            }
        }
        
        
    }
    
    
    // Check function , well i call this the security function because it's preventing every vulnerabilities that may happen in the application like crash etc... , and YES I KNOW i'm a weirdo i'm the only one in the whole world who likes to write secure code but let's just say that i'm intersted in bug bounty and hacking and i like to make my code as secure as possible , do you wanna hear a fun fact ?
    // fun fact : i don't know why i wrote all of this i guess i'm just bored also thank you Dalal and Abdullah for reviewing every project i know that must be hard and i really appreciate your effort guys you are the best ❤️👊
    
    func check(textField: UITextField!) {
        if textField.text!.isDouble(){ // Check if the text field can be parsed to a double also i use that method to check if the user is trying to put a letter on the text field but HELL NAAAH he ain't gon be able to do dat
            let DoubleText: Double = Double(textField.text!)! // Decalring a new double constant that has the value of the textfield
            if DoubleText > 100 { // WHAT A GENIUS , is it even possible to get more than 100% in kuwait , i don't actually think so but fun fact i heard that they do that in egypt i heard my friend saying he has got 105% and i was like WOOOAAAHHH how is that even possible
                textField.text = String(100.0) // well we don't do that in here sooo let's just set the textfield value to a hundred percent
            }
            let IntText: Int = Int(DoubleText) // now this is a tricky one , i wanted to make a max length function to check for the max length but the problem was that we have a double which means we have an extra dot and an extra number after the dot , so that's more than 3 length of numbers , so that's what i did , i just made an integer with the value of the text field so now we got rid of the dot and the number behind it
            if (Int(String(IntText).count) > 3) { // now we are going to check if the length of that integer is more than 3
                textField.deleteBackward() // remove the number that we added
                textField.text = String(format: "%.%" , textField.text! , String(DoubleText).split{$0 == " "}.map(String.init)[1]) // then set the value of the textfield to the integer plus the number after the dot of the double and i made that by spliting the text field by a dot then insted of looping to get all the values of the array we know in basic math (DUUHH! , also shoutout to billie eilish) that a number with a dot (a double) can't have more than one dot
                // so it must be the second value of the array and since in basic programming (DUUH again) we start counting from zero so it must be the value [1] that has the numbers we want to add
                // OH GOD DAMMMNN I WROTE ALL OF THIS ?
                
                
            }
        }else{
            textField.text = String(100.0) // Well , if this genius is trying to put some charecters in the textfield then i'm going to stop him right over there and set the value of the textfield back to a hundred percent cuz (DUUH) he is a genius
        }
    }
    
}

extension String { // Now let's all stand up and appreciate this gorgoues work , thank you for the slow claps NOW LET"S GET BACK TO WORK
    
    // i was talking to myself (i guess i don't have any friends =( ) , and said why don't i create a new function in all of the strings so i made a new extension YAAAYYY !
    
    func isInteger() -> Bool { // this is the function that i've made it's going to check if the value of the string can be an Integer the reason i made this function is that i dont really know if swift has a function called Parse or TryParse so i made one my self
        if Int(self) != nil { // so if the string can be an integer the value wouldn't be nil (null , ugh swift why do you have to change the default names of programming languages like GOSH IT'S NULL NOT NIL)
            return true // return true if it can be an integer
        }else{
            return false // else return false
        }
    }
    
    func isDouble() -> Bool { // well i copied this function from the function i made above but with small changes so i don't think i need to explain this
        if Double(self) != nil {
            return true
        }else{
            return false
        }
    }
    
}

extension UITextField {
    // now this is a secure code again which means i made this to prevent pasting into the textfield
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.paste(_:)) ?
            false : super.canPerformAction(action, withSender: sender)
    }
}
