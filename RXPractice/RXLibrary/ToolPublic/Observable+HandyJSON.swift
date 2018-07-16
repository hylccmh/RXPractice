//
//  Observable+HandyJSON.swift
//  Peak
//
//  Created by huyunlong on 2018/7/13.
//  Copyright © 2018年 peak. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import HandyJSON

extension ObservableType where E == Response {
    public func mapHandyJsonModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(response.mapHandyJsonModel(T.self))
        }
    }
}

extension Response {
    func mapHandyJsonModel<T: HandyJSON>(_ type: T.Type) -> T {
        let jsonString = String.init(data: data, encoding: .utf8)
        if let modelT = JSONDeserializer<T>.deserializeFrom(json: jsonString) {
            return modelT
        }
        return JSONDeserializer<T>.deserializeFrom(json: "{\"msg\":\"请求有误\"}")!
    }
}


