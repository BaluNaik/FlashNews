//
//  FNListPresenterIO.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

protocol FNListPresenterInput {
    
    func feachHeadLines(_ countyCode: String, _ category: String)
    func feachAllNews(_ searchText: String)
    func getCountryCount() -> Int
    func getCategoryCount() -> Int
    func getCountryTitle(_ index:Int) -> String
    func getCountryCode(_ index:Int) -> String
    func getCategoryTitle(_ index:Int) -> String
    func resetArticleList()
    func getArticleCount() -> Int
    func getArticalAtIndex(_ index: Int) -> FNArticle?
    func showDetailArticle(_ index:Int)
}


protocol FNListPresenterOutput: class {
    
    func showLoaderView(_ status: Bool)
    func showErrorView(_ message: String)
    func updateContent()
    
}
