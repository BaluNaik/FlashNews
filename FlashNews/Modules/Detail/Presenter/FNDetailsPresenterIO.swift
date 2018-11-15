//
//  FNDetailsPresenterIO.swift
//  FlashNews
//
//  Created by Balu Naik on 11/15/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import Foundation

protocol FNDetailsPresenterInput {
    
    func getImageUrl() -> String?
    func getArticleTitle() -> String
    func getArticleAuthor() -> String
    func getPublishedDate() -> String?
    func getArticleContent() -> String
    func getArticleUrl() -> String?
    
}


protocol FNDetailsPresenterOutput: class {
    
}
