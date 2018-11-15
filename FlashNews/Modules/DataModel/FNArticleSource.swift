//
//  FNArticleSource.swift
//  FlashNews
//
//  Created by Balu Naik on 11/10/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import Foundation
import ObjectMapper

struct FNArticleSource : Mappable {
    var id : String?
    var name : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
    }
    
}
