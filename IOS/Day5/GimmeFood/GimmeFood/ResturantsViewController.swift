//
//  ResturantsViewController.swift
//  GimmeFood
//
//  Created by Sw2x on 3/24/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit
import Foundation

class ResturantsViewController: UIViewController {
    
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
          self.TableView.delegate = self
          self.TableView.dataSource = self
     

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
             print(lat)
             print(long)
            LoadMore()
       
    }
    
  
    func matchesForRegexInText(regex: String, text: String) -> [String] {

        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text,
                                        options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    
    
    func LoadMore(){
    
            
   
      //  self.showSpinner(onView: self.view)

        DispatchQueue.main.async {
             let spinner = UIActivityIndicatorView(style: .large)
              spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.TableView.bounds.width, height: (self.TableView.bounds.height / 4) - 100)
              self.TableView.tableFooterView = spinner
              self.TableView.tableFooterView?.isHidden = false
            DispatchQueue.global(qos: .background).async {

           
                    for i in counter ..< counter + 15 {
                        arrayOfResturants[i].Image = UIImage.downloadfromurl(url: arrayOfResturants[i].ImageURL)
                        temparrayofResturants.append(arrayOfResturants[i])
                }
                
                                
                                counter += 15
                DispatchQueue.main.async {
                        self.TableView.tableFooterView = nil
                     self.TableView.reloadData()
                }
                            
                
                               
            
                
            }
            }
        }

       
            
        

            
           //  self.TableView.reloadData()
//        self.removeSpinner()
        
      
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       
        if let cell = sender as? UITableViewCell {
    
            let i = TableView.indexPath(for: cell)!.row
               guard let Details = segue.destination as? ResturantDetailViewController else{
                         fatalError()
                     }
            Details.restu = temparrayofResturants[i]
              
          }
    }

    
}
  

    




var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

extension UIImage{
    static func downloadfromurl(url: String) -> UIImage{
        let imageURL = NSURL(string: url)
        guard let imagedData = NSData(contentsOf: (imageURL ?? URL(string: "https://bitsofco.de/content/images/2018/12/broken-1.png")! as NSURL) as URL) else{
            return #imageLiteral(resourceName: "broken-1")
        }
        return UIImage(data: imagedData as Data)!
    }
}


extension ResturantsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temparrayofResturants.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    private func configureCell(cell: ResturantTableViewCell, indexPath: IndexPath) {
          

        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
            let resturant = temparrayofResturants[indexPath.row]
            DispatchQueue.main.sync {
                     cell.Name.text = resturant.name
            }
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    cell.ResturantName.image = resturant.Image
            })
            
            
        }
        
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Restu") as! ResturantTableViewCell
        self.configureCell(cell: cell, indexPath: indexPath)

        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == temparrayofResturants.count - 1 {
            print("Test")
            LoadMore()
           
    }

    }
}

