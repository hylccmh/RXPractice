//
//  MainClassTopView.swift
//  RXPractice
//
//  Created by huyunlong on 2017/12/27.
//  Copyright © 2017年 huyunlong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Action

class MainClassTopView: UIView {
    
    var purchaseBtn:UIButton!
    var myWorkBtn:UIButton!
    var titleImgView:UIImageView!
    let disposeBag = DisposeBag()

    var myworkAction:Action<Void,Bool>! //定义action事件
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)

        self.addView()
        self.initData()
    }
    
    //MARK: -- private
    func initData(){
        
        //通过 action 绑定事件流
         self.myworkAction = Action{
            
            return Observable.just(true)
        }
        
        //绑定事件流
        self.myWorkBtn.rx.tap.asObservable()
            .bind(to: self.myworkAction.inputs)
            .disposed(by: disposeBag)
    }

    //MARK: -- addView
    func addView() {
        
        //内购按钮
        self.purchaseBtn = UIButton.init(type: .custom)
        self.purchaseBtn.frame = CGRect(x:16 ,y:32 , width:44 ,height:44)
        self.purchaseBtn.setImage(UIImage(named:"home_vip"), for: .normal)
        self.purchaseBtn.isExclusiveTouch = true
        self.addSubview(self.purchaseBtn)
        
        //title
        self.titleImgView = UIImageView.init(frame:CGRect(x:(SCREEN_W - 127)/2 , y:32 ,width:127 , height:34))
        self.titleImgView.image = UIImage(named:"home_logo")
        self.addSubview(self.titleImgView)
        
        //mywork
        self.myWorkBtn = UIButton.init(type: .custom)
        self.myWorkBtn.frame = CGRect(x:SCREEN_W - 44 - 16 ,y:32 , width:44  ,height:44 )
        self.myWorkBtn.setImage(UIImage.init(named: "new_icon_myworks"), for: .normal)
        self.myWorkBtn.isExclusiveTouch = true
        self.addSubview(self.myWorkBtn)
        
    }
    
}























