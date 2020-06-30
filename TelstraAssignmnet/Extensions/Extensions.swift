//
//  Extensions.swift
//  TelstraAssignmnet
//
//  Created by Narre Mahesh Kumar on 29/06/20.
//  Copyright © 2020 self. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    var activityIndicatorTag: Int { return 999999 }
   
    func startActivityIndicator() {
        //Set the position - defaults to `center` if no`location`
        //argument is provided
       // let loc =  self.view.center
        let frame  = CGRect(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2, width: 50, height: 50)
        //Ensure the UI is updated from the main thread
        //in case this method is called from a closure
        var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
            DispatchQueue.main.async {
                //Create the activity indicator
                if #available(iOS 13.0, *) {
                   activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
                } else {
                    // Fallback on earlier versions
                    activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
                }
                //Add the tag so we can find the view in order to remove it later
                activityIndicator.tag = self.activityIndicatorTag
                //Set the location
                activityIndicator.frame = frame
               // activityIndicator.center = loc
                activityIndicator.hidesWhenStopped = true
                //Start animating and add the view
                activityIndicator.startAnimating()
                self.view.addSubview(activityIndicator)
            }
    }
    
    func stopActivityIndicator() {
        //Again, we need to ensure the UI is updated from the main thread!
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                if let activityIndicator = self.view.subviews.filter(
                    { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                    activityIndicator.stopAnimating()
                    activityIndicator.removeFromSuperview()
                }
            }
        }
    }
    
    func showAlertWithMessage(message:String){
        let alert =  UIAlertController(title: "Telstra", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { _ in
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default,handler: {_ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
