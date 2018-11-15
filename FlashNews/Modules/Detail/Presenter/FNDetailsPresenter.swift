//
//  FNDetailsPresenter.swift
//  FlashNews
//
//  Created by Balu Naik on 11/15/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import Foundation

class FNDetailsPresenter: NSObject, FNDetailsPresenterInput, FNDetailsInteractorOutput {
    
    weak var userInterface: FNDetailsPresenterOutput?
    var interactor: FNDetailsInteractorInput?
    
    func getImageUrl() -> String? {
        
        return interactor?.getImageUrl()
    }
    
    func getArticleTitle() -> String {
        
        return (interactor?.getArticleTitle())!
    }
    func getArticleAuthor() -> String {
        
        return (interactor?.getArticleAuthor())!
    }
    
    func getPublishedDate() -> String? {
        
        return interactor?.getPublishedDate()
    }
    
    func getArticleContent() -> String {
        
        return (interactor?.getArticleContent())!
    }
    
    func getArticleUrl() -> String? {
        
        return interactor?.getArticleUrl()
    }
   
}
