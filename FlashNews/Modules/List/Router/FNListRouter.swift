//
//  FNListRouter.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNListRouter: NSObject, FNListRouterInput  {
    
    var transitionHandler: FNBaseViewController?
    
    func showDetailArticle(_ article: FNArticle) {
        let detailAssembly = FNDetailsAssembly()
        detailAssembly.input = article
        self.transitionHandler?.pushViewController(detailAssembly.assemblyModule(), true)
    }
}
