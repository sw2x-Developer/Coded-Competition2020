//
//  SymptomsViewController.swift
//  COVID-19KFAS
//
//  Created by Sw2x on 3/11/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class SymptomsViewController: UIViewController {
    
    var yes: Int = 0
    var whichquestion: Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        yes = 0
        whichquestion = 0
        String.popAlert(presenter: self, Title: "ملاحظه", message: "لا يمكن التأكد بنسبه ١٠٠٪ ما اذا كنت مصاب ام لا ، لكن يمكن معرفه احتمال الاصابه بدقه عاليه")
        
    }
    
    
    @IBAction func YesButton(_ sender: Any) {
        yes += 1
        
        whichquestion += 1
        forallbuttons()
    }
    
    
    @IBAction func NoButton(_ sender: Any) {
        whichquestion += 1
        forallbuttons()
    }
    
    
    func forallbuttons(){
        if(whichquestion > 2){
            if(yes >= 2){
                String.popAlert(presenter: self, Title: "ملاحظه", message: "يجب عليك مراجعه الطبيب او التواصل مع وزاره الصحه على هذا الرقم 24970965")
            }else{
                String.popAlert(presenter: self, Title: "سلامات", message: "سلامات يالغالي مافيك الا العافيه")
            }
        }else if(whichquestion == 1){
            questionLabel.text = "هل تشعر بكحه ؟"
        }else if(whichquestion == 2){
            questionLabel.text = "هل تشعر بضيق بالتنفس ؟"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
