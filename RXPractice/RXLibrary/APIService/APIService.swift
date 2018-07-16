//
//  APIService.swift
//  RXPractice
//
//  Created by huyunlong on 2017/12/27.
//  Copyright © 2017年 huyunlong. All rights reserved.
//

import Foundation
import Moya

enum APIService{
    case  mainClassList
}

extension APIService:TargetType{

    var baseURL: URL {
       return URL(string:"http://cmsadmin.fotoable.net")!
    }
    
    var path: String {
        switch self {
        case .mainClassList:
             return "/sandboxColor/category"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mainClassList:
             return .get
        }
    }
    
    var parameters: [String : Any]? {
        
        switch self {
        case .mainClassList:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}


