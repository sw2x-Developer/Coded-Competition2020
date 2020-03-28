//
//  IBElements.swift
//  GimmeFood
//
//  Created by Sw2x on 3/24/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class CustomTextView : UITextView{
   
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat{
        set {
            layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get{
            let c = UIColor(cgColor: layer.borderColor!)
            return c
        }
    }
    
}

@IBDesignable class CustomView : UIView{
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat{
        set {
            layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get{
            let c = UIColor(cgColor: layer.borderColor!)
            return c
        }
    }
}



@IBDesignable class CustomButton : UIButton{
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        set {
            layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get{
            let c = UIColor(cgColor: layer.borderColor!)
            return c
        }
    }
    
}
