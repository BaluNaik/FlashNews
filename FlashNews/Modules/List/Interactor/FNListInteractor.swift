//
//  FNListInteractor.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNListInteractor: NSObject, FNListInteractorInput {
    
    weak var presenter: FNListInteractorOutput?
    var connector = FNNetworkConnector()
    
    //MARK: - FNListInteractorInput methods
    
    func feachHadLines(_ countyCode: String, _ category: String) {
        self.connector.performHeadLineRequestForCountryCode(countyCode,category, success: { (response) in
            print(response)
        }) { (respons) in
            print(respons)
        }
    }
    
    func feachAllNews(_ searchText: String) {
        self.connector.performNewsRequestForAll(searchText, success: { (response) in
            print(response)
        }) { (response) in
            print(response)
        }
    }
}

