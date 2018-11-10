//
//  FNArticle.swift
//  FlashNews
//
//  Created by Balu Naik on 11/10/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import Foundation
import ObjectMapper

struct FNArticle : Mappable {
    var content : String?
    var source : FNArticleSource?
    var urlToImage : String?
    var publishedAt : String?
    var title : String?
    var description : String?
    var author : String?
    var url : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        content <- map["content"]
        source <- map["source"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        title <- map["title"]
        description <- map["description"]
        author <- map["author"]
        url <- map["url"]
    }
    
}
