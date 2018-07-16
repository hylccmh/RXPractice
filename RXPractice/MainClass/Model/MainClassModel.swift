//
//  MainClassModel.swift
//  Peak
//
//  Created by huyunlong on 2018/7/15.
//  Copyright © 2018年 peak. All rights reserved.
//

import UIKit
import HandyJSON

struct MainClassModel: HandyJSON {
    
    var code:NSInteger?
    var data:[MainClassModel_sub]!
}

struct MainClassModel_sub: HandyJSON {
    
    var ID:String?
    var name:String?
    var desc:String?
    var imgUrl:String?
    var gifUrl:String?
    var isUpdate:Bool?
    var backgroundGroup:NSInteger?
}












