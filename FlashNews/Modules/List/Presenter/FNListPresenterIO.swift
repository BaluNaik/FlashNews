//
//  FNListPresenterIO.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

protocol FNListPresenterInput {
    
    func feachHadLines(_ countyCode: String, _ category: String)
    func feachAllNews(_ searchText: String)
    
}


protocol FNListPresenterOutput: class {
    
}
