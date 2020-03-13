//
//  AdviceViewController.swift
//  COVID-19KFAS
//
//  Created by Sw2x on 3/11/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class AdviceViewController: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var TextLabel: UILabel!
    
    var frame = CGRect(x:0,y:0,width:0,height:0)
    var myDict: [String : String] = ["طهر الاسطح في جميع انحاء منزلك و العمل" : "0" , "اغسل يديك الى عشرين ثانيه على الاقل" : "1" , "غط فمك عند العطس و الكحه" : "2"]
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dictAdvice: [String] = [String](myDict.keys)
        pageControl.numberOfPages = myDict.count
        for (key , value) in myDict.enumerated() {
            frame.origin.x = scrollView.frame.size.width * CGFloat(key)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: value.value)
            TextLabel.text = value.key
            self.scrollView.addSubview(imgView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(myDict.count)) , height:
        scrollView.frame.size.height)
        scrollView.delegate = self
        
        TextLabel.text = dictAdvice[0]
        // Do any additional setup after loading the view.
    }
    
  
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
          var dictAdvice: [String] = [String](myDict.keys)
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        TextLabel.text = dictAdvice[Int(pageNumber)]
        
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
