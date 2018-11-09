//
//  FNUtility.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNUtility {
    
    class func showNetworkError() {
        let alertController = UIAlertController(title: "FlashNews", message: "Opps!!. It seems that you are offline.Check your network or wifi connection", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
}
