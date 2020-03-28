//
//  OffersViewController.swift
//  GimmeFood
//
//  Created by Sw2x on 3/28/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self
        // Do any additional setup after loading the view.
        
        DispatchQueue.global(qos: .background).async {
            self.getalloffers()
        }
        
    }
    
    func getalloffers(){
        let url = URL(string: "https://api.talabat.com/api/v1/apps/promotions/1")
                             guard let requestUrl = url else { fatalError() }
                             var request = URLRequest(url: requestUrl)
                             request.httpMethod = "GET"
                             let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                                               
                          
                             if let data = data, let dataString = String(data: data, encoding: .utf8) {
                                 
                              do {
                                               let regex = try NSRegularExpression(pattern: "\"img\":\"(.*?)\"", options: NSRegularExpression.Options.caseInsensitive)
                                               let regex2 = try NSRegularExpression(pattern: "\"rnm\":\"(.*?)\"", options: .caseInsensitive)
                                               let regex3 = try NSRegularExpression(pattern: "\"itemName\":\"(.*?)\"" , options: .caseInsensitive)
                                               let matches = regex.matches(in: dataString, options: [], range: NSRange(location: 0, length: dataString.utf16.count))
                                               let matches2 = regex2.matches(in: dataString, options: [], range: NSRange(location: 0, length: dataString.utf16.count))
                                               let matches3 = regex3.matches(in: dataString, options: [], range: NSRange(location: 0 , length: dataString.utf16.count))
                                               for (match1 , (match2 , match3)) in zip(matches , zip(matches2 , matches3)) {
                                                   let range1 = match1.range(at:1)
                                                   let range2 = match2.range(at:1)
                                                   let range3 = match3.range(at:1)
                                                   if let swiftRange1 = Range(range1, in: dataString), let swiftRange2 = Range(range2 , in: dataString) , let swiftRange3 = Range(range3 , in: dataString) {
                                                   let imgurl = dataString[swiftRange1]
                                                   let name = dataString[swiftRange2]
                                                   let offer = dataString[swiftRange3]
                                                             print("NAME: \(name) | Image URL : \(imgurl) | Offer: \(offer)" )
                                                   
                                                     Offer.init(name: String(name), ImageURL: "https://images.deliveryhero.io/image/talabat/restaurants/\(String(imgurl))", offer: String(offer))
                                              
                                                  
                                               
                                                    
                                                                
                                                   
                                               }
                                               }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                                                                                 self.loadmore()
                                                                                                             })
                                
                                 
                                 
                                               } catch {
                                             
                                           }
                           
                    
                               }
                                                        
                                }
                                                    
                                   task.resume()
                  
    }
    
    override func viewDidAppear(_ animated: Bool) {
    loadmore()
           
    }

    func loadmore(){
        DispatchQueue.main.async{
                     let spinner = UIActivityIndicatorView(style: .large)
                      spinner.startAnimating()
                    spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.TableView.bounds.width, height: (self.TableView.bounds.height / 4) - 100)
                      self.TableView.tableFooterView = spinner
                      self.TableView.tableFooterView?.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        self.TableView.reloadData()
                        self.TableView.tableFooterView = nil
                    })
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

extension OffersViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return arrayOfOffers.count
       }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100.0
       }
    
     private func configureCell(cell: OffersTableViewCell, indexPath: IndexPath) {
           

         DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
             let offer = arrayOfOffers[indexPath.row]
             DispatchQueue.main.sync {
                      cell.Name.text = offer.name
                      cell.Offer.text = offer.offer
             }
            
             DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                     cell.myImage.image = offer.Image
             })
             
             
         }
         
    
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let webURL = URL(string: "https://talabat.com")!
                                           UIApplication.shared.open(webURL)
                             
    }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
         let cell = tableView.dequeueReusableCell(withIdentifier: "Offer") as! OffersTableViewCell
         self.configureCell(cell: cell, indexPath: indexPath)

         return cell
     }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if ((indexPath.section == lastSectionIndex) && (indexPath.row == lastRowIndex)) {
              print("Test")
            self.loadmore()
             
      }

      }
    
}
