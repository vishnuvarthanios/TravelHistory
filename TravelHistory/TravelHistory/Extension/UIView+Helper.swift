//
//  UIView+Helper.swift
//  TravelHistory
//
//  Created by IOS-Vishnu on 06/08/21.
//

import Foundation
import UIKit

extension UIView {
    
    func makeViewCircular(){
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.masksToBounds = true
    }

    func addBorderColor (borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.masksToBounds = false;
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
    
    @IBInspectable
     var setBorderColor: UIColor {
         get { return UIColor(cgColor:layer.borderColor!)}
         set {
             layer.borderColor = newValue.cgColor
         }
     }
     
     @IBInspectable
     var setBorderWidth: CGFloat {
         get { return layer.borderWidth }
         set {
             layer.borderWidth = newValue
         }
     }
     
     @IBInspectable
     var setCornerRadius: CGFloat {
         get { return layer.cornerRadius }
         set {
             layer.cornerRadius = newValue
             layer.masksToBounds = newValue > 0
         }
     }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

 
