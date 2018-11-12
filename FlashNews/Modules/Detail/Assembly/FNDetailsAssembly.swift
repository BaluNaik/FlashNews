//
//  FNDetailsAssembly.swift
//  FlashNews
//
//  Created by Balu Naik on 11/12/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNDetailsAssembly: NSObject, FNAssemblyProtocol {
   
    var input: FNArticle?
    
    required override init() {
        super.init()
    }
    
    func assemblyModule() -> UIViewController {
        
        return self.viewControllerForList()
    }
    
    fileprivate func viewControllerForList() -> FNDetailsViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "FNDetailsViewController") as? FNDetailsViewController
        viewController?.article = self.input
        
        return viewController!
    }
}
