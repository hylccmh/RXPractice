//
//  MainClassViewModel.swift
//  RXPractice
//
//  Created by huyunlong on 2017/12/27.
//  Copyright © 2017年 huyunlong. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper
import HandyJSON
import RxCocoa

class MainClassViewModel {

    private let provider = MoyaProvider<APIService>()
    let disposeBag = DisposeBag()
    var dataSource = BehaviorRelay<[MainClassModelMapObject_sub]>(value:[])
    var networkError = BehaviorRelay(value: Error.self)
}

//MARK: -- 网络
extension  MainClassViewModel {
    
    //网络请求-- ObjectMapper
    func getClassListWithMapObject(){
        provider.rx.request(.mainClassList).asObservable().mapObjectModel(MainClassModelMapObject.self).subscribe({ [unowned self] (event) in
            
            switch event {
            case let  .next(classModel):
                print("ObjectMapper -- 加载网络成功")
                self.dataSource.accept(classModel.data)
                
            case let .error( error):
                print("error:", error)
                self.networkError.accept(error as! Error.Protocol)
            case .completed: break
            }
        }).disposed(by: self.disposeBag)
    }
    
    
    //网络请求-- HandyJSON
    func getClassListWithMapHandyJson(){
        provider.rx.request(.mainClassList).asObservable().mapHandyJsonModel(MainClassModel.self).subscribe({ [unowned self] (event) in
            
            switch event {
            case let  .next(classModel):
                
                print("HandyJSON -- 加载网络成功")
                
            case let .error( error):
                print("error:", error)
               self.networkError.accept(error as! Error.Protocol)
            case .completed: break
            }
        }).disposed(by: self.disposeBag)
    }
    
}






































