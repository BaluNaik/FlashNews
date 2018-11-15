//
//  FNListInteractor.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class FNListInteractor: NSObject, FNListInteractorInput {
    
    weak var presenter: FNListInteractorOutput?
    var connector = FNNetworkConnector()
    var countryList : [String : String] = ["ae" : "United Arab Emirates",
                                           "ar" : "Argentina",
                                           "at":"Austria",
                                           "au":"Australia",
                                           "be": "Belgium",
                                           "bg":"Bulgaria",
                                           "br": "Brazil",
                                           "ca":"Canada",
                                           "ch":"Switzerland",
                                           "in": "India",
                                           "gb": "United Kingdom",
                                           "us":"United States"]
    
    var categoryType: [String:String] = ["Business":"Business",
                                         "Entertainment":"Entertainment",
                                         "General":"General",
                                         "Health science":"Health science",
                                         "Sports":"Sports",
                                         "Technology":"Technology"]
    var articleList = [FNArticle]()
    
    //MARK: - FNListInteractorInput methods
    
    func feachHeadLines(_ countyCode: String, _ category: String) {
        self.connector.performHeadLineRequestForCountryCode(countyCode,category, success: { (response) in
            let sJSONObj = JSON(response)
            if let list = Mapper<FNArticle>().mapArray(JSONObject:sJSONObj.dictionaryObject?["articles"]!) {
                self.articleList = list
            }
            self.presenter?.updateContent()
        }) { (response) in
            let sJSONObj = JSON(response)
            self.presenter?.showErrorView(sJSONObj["message"].string!)
        }
    }
    
    func feachAllNews(_ searchText: String) {
        self.connector.performNewsRequestForAll(searchText, success: { (response) in
            let sJSONObj = JSON(response)
            if let list = Mapper<FNArticle>().mapArray(JSONObject:sJSONObj.dictionaryObject?["articles"]!) {
                self.articleList = list
            }
            self.presenter?.updateContent()
        }) { (response) in
            let sJSONObj = JSON(response)
            self.presenter?.showErrorView(sJSONObj["message"].string!)
        }
    }
    
    func getCountryCount() -> Int {
        
        return self.countryList.count
    }
    
    func getCategoryCount() -> Int {
        
        return self.categoryType.count
    }
    
    func getCountryTitle(_ index:Int) -> String {
        let list = Array(self.countryList.values)
        
        return list[index]
    }
    
    func getCountryCode(_ index:Int) -> String {
        let list = Array(self.countryList.keys)
        
        return list[index]
    }
    
    func getCategoryTitle(_ index:Int) -> String {
        
        let list = Array(self.categoryType.values)
        
        return list[index]
    }
    
    func resetArticleList() {
        self.articleList = []
    }
    
    func getArticleCount() -> Int {
        
        return self.articleList.count
    }
    
    func getArticalAtIndex(_ index: Int) -> FNArticle? {
        
        return self.articleList[index]
    }
}
