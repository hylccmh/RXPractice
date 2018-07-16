//
//  MainClassModelMapJson.swift
//  Peak
//
//  Created by huyunlong on 2018/7/15.
//  Copyright © 2018年 peak. All rights reserved.
//

import UIKit
import ObjectMapper

class MainClassModelMapObject: Mappable {
    
    var code:NSInteger?
    var data:[MainClassModelMapObject_sub]!
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
    }
}

class MainClassModelMapObject_sub: Mappable {
    
    var ID:String?
    var name:String?
    var desc:String?
    var imgUrl:String?
    var gifUrl:String?
    var isUpdate:Bool?
    var backgroundGroup:NSInteger?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        ID <- map["ID"]
        name <- map["name"]
        desc <- map["desc"]
        imgUrl <- map["imgUrl"]
        gifUrl <- map["gifUrl"]
        isUpdate <- map["isUpdate"]
        backgroundGroup <- map["backgroundGroup"]
    }
}









