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
        self.interactor?.feachHadLines(countyCode, category)
    }
    
    func feachAllNews(_ searchText: String) {
        self.interactor?.feachAllNews(searchText)
    }
    
}
