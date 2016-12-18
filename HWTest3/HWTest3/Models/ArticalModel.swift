//
//  ArticalModel.swift
//  HWTest3
//
//  Created by otey on 12/17/16.
//  Copyright © 2016 tey. All rights reserved.
//

import Foundation
import ObjectMapper


class ArticalModel:Mappable{
    
    var title: String?
    var created_date: String?
    var description: String?
    var image: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["TITLE"]
        created_date <- map["CREATED_DATE"]
        description <- map["DESCRIPTION"]
        image <- map["IMAGE"]
    }
    


    
    
}
