//
//  Observable+ObjectMapper.swift
//  Peak
//
//  Created by huyunlong on 2018/7/12.
//  Copyright © 2018年 peak. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

// MARK: - Json -> Model
extension Response {
    
    func mapObjectModel<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: try mapJSON()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    func mapObjectArray<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T] {
        guard let array = try mapJSON() as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return Mapper<T>(context: context).mapArray(JSONArray: array)
    }
}

// MARK: - Json -> Observable<Model>

extension ObservableType where E == Response {
    // 将Json解析为Observable<Model>
    public func mapObjectModel<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObjectModel(T.self))
        }
    }
    // 将Json解析为Observable<[Model]>
    public func mapObjectArray<T: BaseMappable>(_ type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapObjectArray(T.self))
        }
    }
}













































