//
//  ViewController.swift
//  covid19
//
//  Created by Sw2x on 3/7/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var InstagramUIView: UIImageView!
    
    @IBOutlet weak var TwitterUIView: UIImageView!
    
    @IBOutlet weak var SnapchatUIView: UIImageView!
    
    
    @IBOutlet weak var StatsButton: UIButton!
    
    @IBOutlet weak var InfoButton: UIButton!
    
    @IBOutlet weak var MapButton: UIButton!
    
    var Language: String = "Arabic"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapofinstagram = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapInstagram))
        InstagramUIView.addGestureRecognizer(tapofinstagram)
        InstagramUIView.isUserInteractionEnabled = true
        let tapoftwitter = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapTwitter))
        TwitterUIView.addGestureRecognizer(tapoftwitter)
        TwitterUIView.isUserInteractionEnabled = true
        
        let tapofsnapchat = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapSnapchat))
        SnapchatUIView.addGestureRecognizer(tapofsnapchat)
        SnapchatUIView.isUserInteractionEnabled = true
        
        if(Language == "English"){
           // Change Button names
        }
       
    }

    @objc func tapInstagram(){
            let instagramURL = URL(string: "instagram://user?username=sw2x")
            if let instagramURL = instagramURL {
                if UIApplication.shared.canOpenURL(instagramURL) {
                    UIApplication.shared.openURL(instagramURL)
                }else{
                    let webURL = URL(string: "https://instagram.com/sw2x")!
                              UIApplication.shared.open(webURL)
                }
            }
    }

    @objc func tapTwitter(){
        let twitterURL = URL(string: "twitter://user?screen_name=sw2xx_")
                   if let twitterURL = twitterURL {
                       if UIApplication.shared.canOpenURL(twitterURL) {
                           UIApplication.shared.openURL(twitterURL)
                       }else{
                           let webURL = URL(string: "https://twitter.com/sw2xx_")!
                                     UIApplication.shared.open(webURL)
                       }
                   }
    }

    @objc func tapSnapchat(){
        let snapURL = URL(string: "snapchat://add/mhk12")
                   if let snapURL = snapURL {
                       if UIApplication.shared.canOpenURL(snapURL) {
                           UIApplication.shared.openURL(snapURL)
                       }else{
                           let webURL = URL(string: "https://snapchat.com/add/mhk12")!
                                     UIApplication.shared.open(webURL)
                       }
                   }
    }
    
    
    
    
    @IBAction func COVIDMAP(_ sender: Any) {
        let webURL = URL(string: "https://infographics.channelnewsasia.com/covid-19/map.html")!
        UIApplication.shared.open(webURL)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination.navigationItem.title == "احصائيات"){
           let vc = segue.destination as! StatsViewController
            
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
                                       vc.RecoveredLabel.text = "ERROR"
                        return
                    }
        
                }
                
                if let response = response as? HTTPURLResponse {
                    print("Response HTTP Status code: \(response.statusCode)")
                }
                
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                    DispatchQueue.main.async{
                    
                    vc.CasesLabel.text = (vc.CasesLabel.text ?? "عدد المصابون:") + "\n" + dataString.capturedGroups(withRegex: "<div class=\"maincounter-number\"> <span style=\"color:#aaa\">(.*?) </span> </div>")[0]
                    vc.DeathsLabel.text = (vc.DeathsLabel.text ?? "الوفيات:") + "\n" +  dataString.capturedGroups(withRegex: "<div class=\"maincounter-number\"> <span>(.*?)</span> </div>")[0]
                    vc.RecoveredLabel.text = (vc.RecoveredLabel.text ?? "المشافون:") + "\n" + dataString.capturedGroups(withRegex: "<div class=\"maincounter-number\" style=\"color:#8ACA2B \"> <span>(.*?)</span> </div>")[0]
                    vc.Loadingthing.stopAnimating()
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
