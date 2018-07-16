//
//  PublicDefine.swift
//  RXPractice
//
//  Created by huyunlong on 2017/12/27.
//  Copyright © 2017年 fotoable. All rights reserved.
//

import Foundation
import UIKit

//屏幕宽
let SCREEN_W = UIScreen.main.bounds.width
//屏幕高
let SCREEN_H = UIScreen.main.bounds.height
//导航栏高度
let Nav_H:CGFloat = 64
//切换栏高度
let TabBar_H:CGFloat = 49
//系统版本
let iOS_VERSION = (UIDevice.current.systemVersion as NSString).doubleValue

//是否iPad
let isPad = UIDevice.current.userInterfaceIdiom == .pad ? true : false

//是否iPhoneX
let iPhoneX = (UIScreen.main.bounds.width == 375 && UIScreen.main.bounds.height == 812) ? true : false

//是否Iphone5
let iPhone5 = (UIScreen.main.bounds.width == 320 && UIScreen.main.bounds.height == 568) ? true : false

//是否 iPhone_6_6s_7_8
let iPhone_6_6s_7_8 = (UIScreen.main.bounds.width == 375 && UIScreen.main.bounds.height == 667) ? true : false

//获取 bundle Id
let bundleID = Bundle.main.bundleIdentifier!

//获取APP版本号 --- 标识应用程序的发布版本号
let APPVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!

//获取build号
let APPBuildID = Bundle.main.infoDictionary!["CFBundleVersion"]!

//获取App显示名
let APPName = Bundle.main.infoDictionary!["CFBundleDisplayName"]!

//获取当前语言
let currentLocalLanguage = NSLocale.preferredLanguages[0]

//当前语言编码（手机）
let currLanguageCode = NSLocale.current.languageCode!

//国际编码（手机）
let currLocaleCode = NSLocale.current.regionCode!

//颜色设置方式一：
func RGBA(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat)->UIColor{
    return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha:A)
    
}
//颜色设置方式二：
func colorWithHexString(hex:String) ->UIColor {
    var  Str :NSString = hex as NSString
    if hex.hasPrefix("#"){
        Str=(hex as NSString).substring(from: 1) as NSString
    }
    let redStr = (Str as NSString ).substring(to: 2)
    let greenStr = ((Str as NSString).substring(from: 2) as NSString).substring(to: 2)
    let blueStr = ((Str as NSString).substring(from: 4) as NSString).substring(to: 2)
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string:redStr).scanHexInt32(&r)
    Scanner(string: greenStr).scanHexInt32(&g)
    Scanner(string: blueStr).scanHexInt32(&b)
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
}
//输出语句
func NSLog<T>(message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
        print("\(methodName)[\(lineNumber)]:\(message)");
    #endif
}

//计算UILabel 的高度
func calculate_UILabel_txt_Size(text:String, font:UIFont, width:CGFloat) -> CGSize{
    
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    
    return label.frame.size
}

//get the x,y of the frame
func FRAME_X(frame:CGRect) ->CGFloat{
    return frame.origin.x
}

func FRAME_Y(frame:CGRect) ->CGFloat{
    return frame.origin.y
}

//get the size of the frame
func FRAME_W(frame:CGRect) ->CGFloat{
    return frame.size.width
}
func FRAME_H(frame:CGRect) ->CGFloat{
    return frame.size.height
}

//多语言适配
func CALocalizedString(key:String) ->String{
    return Bundle.main.localizedString(forKey: key, value: key, table: nil)
}

//网络请求时保证字符串是安全的
func SafeString(string:String) ->String{    
   var handleStr = string
    if handleStr.isEmpty {
        handleStr = ""
    }
    return handleStr
}














































