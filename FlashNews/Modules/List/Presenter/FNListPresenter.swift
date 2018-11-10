//
//  FNListPresenter.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNListPresenter: NSObject, FNListPresenterInput, FNListInteractorOutput {
    
    weak var userInterface: FNListPresenterOutput?
    var interactor: FNListInteractorInput?
    
    
    //MARK: FNListPresenterInput Methods
    
    func feachHadLines(_ countyCode: String, _ category: String) {
        self.userInterface?.showLoaderView(true)
        self.interactor?.feachHadLines(countyCode, category)
    }
    
    func feachAllNews(_ searchText: String) {
        self.userInterface?.showLoaderView(true)
        self.interactor?.feachAllNews(searchText)
    }
    
    func getCountryCount() -> Int {
        
        return (self.interactor?.getCountryCount())!
    }
    
    func getCategoryCount() -> Int {
        
        return (self.interactor?.getCategoryCount())!
    }
    
    func getCountryTitle(_ index:Int) -> String {
        
        return (self.interactor?.getCountryTitle(index))!
    }
    
    func getCountryCode(_ index:Int) -> String {
        
        return (self.interactor?.getCountryCode(index))!
    }
    
    func getCategoryTitle(_ index: Int) -> String {
        
        return (self.interactor?.getCategoryTitle(index))!
    }
    
    func resetArticleList() {
        self.interactor?.resetArticleList()
    }
    
    func getArticleCount() -> Int {
        
        return self.interactor!.getArticleCount()
    }
    
    func getArticalAtIndex(_ index: Int) -> FNArticle? {
        
        return self.interactor!.getArticalAtIndex(index)
    }
    
    
    //MARK: FNListInteractorOutput
    
    func updateContent() {
        self.userInterface?.showLoaderView(false)
        self.userInterface?.updateContent()
    }
    
    func showErrorView(_ message: String) {
        self.userInterface?.showLoaderView(false)
        self.userInterface?.showErrorView(message)
    }
    
}
