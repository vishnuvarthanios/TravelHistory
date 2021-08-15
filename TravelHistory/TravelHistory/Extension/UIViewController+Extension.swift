//
//  UIViewController+Extension.swift
//  TravelHistory
//
//  Created by Vishnuvarthan Deivendiran on 15/08/21.
//

import Foundation
import UIKit

@objc protocol ActivityIndicatorDelegate {
    func startActivityIndicator()
    func stopActivityIndicator()
}


extension UIViewController : ActivityIndicatorDelegate{
    
    var activityIndicatorHoldingViewTag: Int { return 999999 }
    
    
    func startActivityIndicator(){
        
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                let holdingView = UIView(frame: UIScreen.main.bounds)
                holdingView.backgroundColor = .black
                holdingView.alpha = 0.3
                
                //Add the tag so we can find the view in order to remove it later
                holdingView.tag = self.activityIndicatorHoldingViewTag
                
                //create activity indicator
                let activityIndicator = UIActivityIndicatorView(style: .large)
                activityIndicator.center = self.view.center
                activityIndicator.hidesWhenStopped = true
                
                //Start animating and add the view
                activityIndicator.startAnimating()
                holdingView.addSubview(activityIndicator)
                self.view.addSubview(holdingView)
            }
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                if let holdingView = self.view.subviews.filter({ $0.tag == self.activityIndicatorHoldingViewTag}).first {
                    holdingView.removeFromSuperview()
                }
            }
        }
    }
    
}
