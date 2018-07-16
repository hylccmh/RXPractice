
//
//  MainClassTableViewCell.swift
//  RXPractice
//
//  Created by huyunlong on 2017/12/29.
//  Copyright © 2017年 huyunlong. All rights reserved.
//

import UIKit
import Kingfisher

class MainClassTableViewCell: UITableViewCell {

    var bgImgView:UIImageView!
    var circleImgView:UIImageView!
    var gifImgView:UIImageView!
    var titleLbl:UILabel!
    var describeLbl:UILabel!
    var updatedBtn:UIButton!
    var model:MainClassModelMapObject_sub?
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        //bgImgView
        self.bgImgView = UIImageView.init(frame: CGRect(x:16 , y:0 , width:SCREEN_W - 16*2 , height:216 ))
        self.bgImgView.image = UIImage(named:"white_bg")
        self.addSubview(self.bgImgView)
        
        //circleImgView
        self.circleImgView = UIImageView.init(frame: CGRect(x: SCREEN_W - 343 - 16, y: 0, width: 343, height: 216))
        self.addSubview(self.circleImgView)
        
        //gifImgView
        self.gifImgView = UIImageView.init(frame: CGRect(x: SCREEN_W - 343 - 16, y: 0, width: 343, height: 216))
        self.addSubview(self.gifImgView)
        
        //titleLbl
        self.titleLbl = UILabel.init(frame: CGRect(x: 32, y: 52, width: 200, height: 34))
        self.titleLbl.font = UIFont.init(name:"Avenir-Black"  , size: 28)
        self.titleLbl.textColor = colorWithHexString(hex:"2B2525")
        self.addSubview(self.titleLbl)
        
        //describeLbl
        self.describeLbl = UILabel.init(frame: CGRect(x:32, y:87,width: SCREEN_W - 32 - 220, height: 20 + 20 + 20))
        self.describeLbl.font = UIFont.init(name: "Avenir-Black", size: 14)
        self.describeLbl.textColor = colorWithHexString(hex: "2B2525")
        self.describeLbl.numberOfLines = 0;
        self.addSubview(self.describeLbl)
        
        //updatedBtn
        self.updatedBtn = UIButton.init(type: .custom)
        self.updatedBtn.frame = CGRect(x: 32, y: 124 + 25, width: 64, height: 24)
        self.updatedBtn.backgroundColor = colorWithHexString(hex: "FF8903")
        self.updatedBtn.setTitle("Updated", for: .normal)
        self.updatedBtn.titleLabel?.font = UIFont.init(name:"Avenir-Heavy" , size: 12)
        self.updatedBtn.setTitleColor(UIColor.white, for: .normal)
        self.updatedBtn.isExclusiveTouch = true
        self.updatedBtn.isEnabled = false
        self.updatedBtn.adjustsImageWhenDisabled = false
        self.updatedBtn.layer.cornerRadius = 12
        self.updatedBtn.clipsToBounds = true
        self.addSubview(self.updatedBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- private
    func setModel(model:MainClassModelMapObject_sub){
    
        self.model = model
        
        //title
        self.titleLbl.text = model.name
        
        //desc
        self.describeLbl.text = model.desc
        
        let size = calculate_UILabel_txt_Size(text: model.desc!, font:UIFont.init(name: "Avenir-Black", size: 14)! , width: SCREEN_W - 32 - 220)
        self.describeLbl.frame = CGRect(x:32, y:87,width: SCREEN_W - 32 - 220, height: size.height)
        
        //circle
        self.circleImgView.image = UIImage.init(named: "cir_bg_\(model.backgroundGroup!)")
    
        
        //gif
        let gifImgURL = URL.init(string: model.gifUrl!)
        self.gifImgView.kf.setImage(with: gifImgURL, placeholder: nil, options: nil, progressBlock: { (receivedSize ,totalSize) in
            
        }, completionHandler: nil)
        
        
        //update
        if  (model.isUpdate != nil) as Bool {
            self.updatedBtn.isHidden = false
        }else{
            self.updatedBtn.isHidden = true
        }
    }
}


































