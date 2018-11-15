//
//  FNUtility.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit
import SVProgressHUD

class FNUtility {
    
    class func showNetworkError() {
        SVProgressHUD.dismiss()
        let alertController = UIAlertController(title: "FlashNews", message: "Opps!!. It seems that you are offline.Check your network or wifi connection", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    static func ConvertDateFormater(comingDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let formatteddate = dateFormatter.date(from: comingDate) else {
            assert(false, "no date from string")
            
            return comingDate
        }
        dateFormatter.dateFormat = "dd MMM yyyy hh:mm a"
        let timeStamp = dateFormatter.string(from: formatteddate)
        
        return timeStamp
    }
    
    static func applyShadowToView(_ view :UIView) {
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 3;
        view.layer.shadowOpacity = 1;
        view.layer.shadowColor = UIColor.black.cgColor
    }
    
}
