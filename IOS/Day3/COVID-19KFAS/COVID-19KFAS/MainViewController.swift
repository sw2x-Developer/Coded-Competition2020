//
//  MainViewController.swift
//  COVID-19KFAS
//
//  Created by Sw2x on 3/11/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController , WKUIDelegate , WKNavigationDelegate  {
        

    
    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.destination.navigationItem.title == "احصائيات"){
              let vc = segue.destination as! StatsViewController
            vc.showSpinner(onView: vc.view)
               let url = URL(string: "https://www.worldometers.info/coronavirus/")
               guard let requestUrl = url else { fatalError() }
               var request = URLRequest(url: requestUrl)
               request.httpMethod = "GET"
               let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                   
                   if let error = error {
                       print("Error took place \(error)")
                       DispatchQueue.main.async {
                       vc.CasesLabel.text = "ERROR (Server may be down or you are not connected to the internet please check then try again)"
                       vc.DeathsLabel.text = "ERROR"
                       vc.RecoverdLabel.text = "ERROR"
                        vc.KuwaitCases.text = "ERROR"
                           return
                       }
           
                   }
                   
                 
                   if let data = data, let dataString = String(data: data, encoding: .utf8) {
                     //  print("Response data string:\n \(dataString)")
                    print(dataString.capturedGroups(withRegex: "<div class=\"maincounter-number\"> <span style=\"color:#aaa\">(.*?) </span> </div>")[0])
                       DispatchQueue.main.async{
                       
                       vc.CasesLabel.text =  dataString.capturedGroups(withRegex: "<div class=\"maincounter-number\"> <span style=\"color:#aaa\">(.*?) </span> </div>")[0]
                       vc.DeathsLabel.text =   dataString.capturedGroups(withRegex: "<div class=\"maincounter-number\"> <span>(.*?)</span> </div>")[0]
                       vc.RecoverdLabel.text = dataString.capturedGroups(withRegex: "<div class=\"maincounter-number\" style=\"color:#8ACA2B \"> <span>(.*?)</span> </div>")[0]
                        
                        let otherurl = URL(string: "https://corona.e.gov.kw/En/")
                        guard let otherrequestUrl = otherurl else { fatalError() }
                        var otherrequest = URLRequest(url: otherrequestUrl)
                        otherrequest.httpMethod = "GET"
                        let othertask = URLSession.shared.dataTask(with: otherrequest){ (otherdata , otherresponse , othererror) in
                            
                            if let othererror = othererror {
                                print("Error took place \(othererror)")
                                DispatchQueue.main.async {
                                                     vc.KuwaitCases.text = "ERROR"
                                                        return
                                                    }
                            }
                            
                            if let otherdata = otherdata, let otherDataString = String(data: otherdata, encoding: .utf8){
                               // print(otherDataString)
                                print(otherDataString.capturedGroups(withRegex: "<h2 class=\"timer count-title count-number\" data-to=\"(.*?)\"")[0])
                                DispatchQueue.main.async{
                                    vc.KuwaitCases.text = otherDataString.capturedGroups(withRegex: "<h2 class=\"timer count-title count-number\" data-to=\"(.*?)\"")[0]
                                }
                                    
                            }
                            
                        }
                        
                        othertask.resume()
                        
                        sleep(2)

                        vc.removeSpinner()
                      
                       }
                   }
                   
               }
               task.resume()
            
           }
       }

}



extension String {

    
    static func popAlert(presenter: UIViewController, Title: String , message: String)
    {
        let alertController = UIAlertController(title: Title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        presenter.present(alertController, animated: true)
    }
    
    static func RepeatString(text: String , repeat: Int , splitter: String = "") -> String {
        var result: String = ""
        for _ in 0...`repeat` - 1 {
            result = result + text + splitter
        }
        return result
    }
    
    func regex(pattern: String) -> [String] {
      do {
        let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
        let nsstr = self as NSString
        let all = NSRange(location: 0, length: nsstr.length)
        var matches : [String] = [String]()
        regex.enumerateMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: all) {
          (result : NSTextCheckingResult?, _, _) in
          if let r = result {
            let result = nsstr.substring(with: r.range) as String
            matches.append(result)
          }
        }
        return matches
      } catch {
        return [String]()
      }
    }
    
    
    public func capturedGroups(withRegex pattern: String) -> [String] {
          var results = [String]()

          var regex: NSRegularExpression
          do {
              regex = try NSRegularExpression(pattern: pattern, options: [])
          } catch {
              return results
          }
          let matches = regex.matches(in: self, options: [], range: NSRange(location:0, length: self.count))

          guard let match = matches.first else { return results }

          let lastRangeIndex = match.numberOfRanges - 1
          guard lastRangeIndex >= 1 else { return results }

          for i in 1...lastRangeIndex {
              let capturedGroupIndex = match.range(at: i)
              let matchedString = (self as NSString).substring(with: capturedGroupIndex)
              results.append(matchedString)
          }

          return results
      }
}
