//
//  LanguageViewController.swift
//  covid19
//
//  Created by Sw2x on 3/10/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        let ValueSelected = pickerData[row] as String
        Languagee = ValueSelected
    }
    

    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    var Languagee: String = "Arabic"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["Arabic" , "English"]
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as! ViewController
        vc.Language = Languagee
    }
    

}
