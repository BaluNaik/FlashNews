//
//  FNDetailsInteractor.swift
//  FlashNews
//
//  Created by Balu Naik on 11/15/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import Foundation

class FNDetailsInteractor: NSObject, FNDetailsInteractorInput {
    
    weak var presenter: FNDetailsInteractorOutput?
    var article: FNArticle?
    
    func getImageUrl() -> String? {
        
        return article?.urlToImage
    }
    
    func getArticleTitle() -> String {
        
        return (article?.title ?? "")
    }
    
    func getArticleAuthor() -> String {
        
        return (article?.author ?? "")
    }
    
    func getPublishedDate() -> String? {
        
        return article?.publishedAt
    }
    
    func getArticleContent() -> String {
        
        return (article?.content ?? "")
    }
    
    func getArticleUrl() -> String? {
        
        return article?.url
    }

}
