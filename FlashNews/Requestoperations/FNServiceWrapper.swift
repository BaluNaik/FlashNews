//
//  FNServiceWrapper.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

protocol IWSRequest {
    var progress: Progress { get }
    func cancel()
    var isRunning: Bool {get}
}

class FNServiceWrapper : NSObject {
    
    class func getRequestHeader() -> [String:String] {
        var requestHeader = [String:String]()
        requestHeader["x-api-key"] = FNServiceURL.API_KEY
        requestHeader["Authorization"] = "Bearer"
        
        return requestHeader
    }
 
    
    //MARK: GET REQUEST
    
    @discardableResult class func invokeGETRequest(wsURL:String, parms:[String:String], success:@escaping (Any) -> Void, failure:@escaping (Any) -> Void ) -> IWSRequest? {
        if !(Reachability.isConnectedToNetwork()) {
            FNUtility.showNetworkError()
            
            return nil
        }
        let requestURL = FNServiceURL.URL_BASE + wsURL
        
        return Alamofire.request(requestURL, method: .get, parameters: parms, encoding: URLEncoding.default, headers: FNServiceWrapper.getRequestHeader()).responseJSON { (responseData:DataResponse<Any>) in
            if responseData.response?.statusCode == 200 {
                success(responseData.result.value!)
            } else {
                failure(responseData.result.value!)
            }
        }
    }
}

extension Request : IWSRequest {
    
    internal var progress: Progress {
        return self.progress
    }
    
    func cancel() {
        task?.cancel()
    }
    
    var isRunning: Bool {
        return task!.state == .running
    }
}

