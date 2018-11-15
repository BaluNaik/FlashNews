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
        
        return viewController!
    }
    
    fileprivate func presenterModuleWithVC(controller: FNDetailsViewController) -> FNDetailsPresenter {
        let presenter = FNDetailsPresenter()
        presenter.userInterface = controller
        presenter.interactor = self.interactorModuleWithPresenter(presenter: presenter)
        
        return presenter
    }
    
    fileprivate func interactorModuleWithPresenter(presenter: FNDetailsPresenter) -> FNDetailsInteractor {
        let interactor = FNDetailsInteractor()
        interactor.presenter = presenter
        interactor.article = self.input
        
        return interactor
    }
}
