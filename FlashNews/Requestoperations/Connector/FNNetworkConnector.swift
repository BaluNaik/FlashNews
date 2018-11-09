//
//  FNNetworkConnector.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNNetworkConnector: NSObject {
    
    func performHeadLineRequestForCountryCode(_ countryCode: String,_ category: String, success successBlock: @escaping ((Any) -> Void), failure failureBlock: @escaping ((Any) -> Void)) {
        let requestPrameters: [String:String] = ["country": countryCode, "category":category, "language":"en"]
        FNServiceWrapper.invokeGETRequest(wsURL: FNServiceURL.URL_HEADLINES, parms: requestPrameters, success: { (response) in
            successBlock(response)
        }) { (respnse) in
            failureBlock(respnse)
        }
    }
    
    func performNewsRequestForAll(_ searchText: String, success successBlock: @escaping ((Any) -> Void), failure failureBlock: @escaping ((Any) -> Void)) {
        let requestPrameters: [String:String] = ["q": searchText, "language":"en"]
        FNServiceWrapper.invokeGETRequest(wsURL: FNServiceURL.URL_EVERYTHING, parms: requestPrameters, success: { (response) in
            successBlock(response)
        }) { (respnse) in
            failureBlock(respnse)
        }
    }
    
}
