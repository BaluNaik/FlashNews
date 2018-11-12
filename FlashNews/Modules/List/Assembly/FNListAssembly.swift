//
//  FNListAssembly.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNListAssembly: NSObject, FNAssemblyProtocol {
    
    required override init() {
        super.init()
    }
    
    func assemblyModule() -> UIViewController {
        
        return self.viewControllerForList()
    }
    
    fileprivate func viewControllerForList() -> FNListViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "FNListViewController") as? FNListViewController
        viewController?.presenter = self.presenterModuleWithVC(controller: viewController!)
        
        return viewController!
    }
    
    fileprivate func presenterModuleWithVC(controller: FNListViewController) -> FNListPresenter {
        let presenter = FNListPresenter()
        presenter.userInterface = controller
        presenter.interactor = self.interactorModuleWithPresenter(presenter: presenter)
        presenter.Router = self.RouterModuleWithController(controller: controller)
        
        return presenter
    }
    
    fileprivate func interactorModuleWithPresenter(presenter: FNListPresenter) -> FNListInteractor {
        let interactor = FNListInteractor()
        interactor.presenter = presenter
        
        return interactor
    }
    
    fileprivate func RouterModuleWithController(controller: FNListViewController) -> FNListRouter {
        let router = FNListRouter()
        router.transitionHandler = controller
        
        return router
    }
}
