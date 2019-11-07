//
//  Font+additions.swift
//  CFCommon
//
//  Created by Topband on 2019/11/6.
//

import Foundation

// ------------字体--------------

/// Regular 苹方字体
public func regularFont(_ size:CGFloat) -> UIFont {
    let regular:UIFont = UIFont.init(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    return regular
}

/// PingFangSC-Semibold字体
public func boldFont(_ size:CGFloat) -> UIFont {
    let bold:UIFont = UIFont.init(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
    return bold
}

public func mediumFont(_ size:CGFloat) -> UIFont {
    let thin:UIFont = UIFont.init(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    return thin
}

public func lightFont(_ size:CGFloat) -> UIFont {
    let medium:UIFont = UIFont.init(name: "PingFangSC-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    return medium
}
public func thinFont(_ size:CGFloat) -> UIFont {
    let medium:UIFont = UIFont.init(name: "PingFangSC-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
    return medium
}


public func printAllFontName(){
    for item in UIFont.familyNames {
        NSLog("===========\(item):")
        let names = UIFont.fontNames(forFamilyName: item)
        for value in names {
            NSLog("==\(value)")
        }
    }
}

//---------------颜色---------------
public func RGBH(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ alpha:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}
public func RGB(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return RGBH(r, g, b, 1.0)
}

// 样式 #5B5B5B 或 0x5B5B5B 或 5B5B5B  -> UIColor
public func UIColorFromRGB(_ color_vaule : String , _ alpha : CGFloat = 1) -> UIColor {
    
    if color_vaule.isEmpty {
        return UIColor.clear
    }
    
    var cString = color_vaule.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    
    if cString.count == 0 {
        return UIColor.clear
    }
    
    if cString.hasPrefix("#") {
        cString = cString.replacingOccurrences(of: "#", with: "")
    }
    
    if cString.hasPrefix("0x") {
        cString = cString.replacingOccurrences(of: "0x", with: "")
    }
    
    if cString.count < 6 && cString.count != 6 {
        
        return UIColor.clear
    }
    
    let value = "0x\(cString)"
    
    let scanner = Scanner(string:value)
    
    var hexValue : UInt64 = 0
    //查找16进制是否存在
    if scanner.scanHexInt64(&hexValue) {
        let redValue = CGFloat((hexValue & 0xFF0000) >> 16)/255.0
        let greenValue = CGFloat((hexValue & 0xFF00) >> 8)/255.0
        let blueValue = CGFloat(hexValue & 0xFF)/255.0
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    } else {
        return UIColor.clear
    }
}

/// 颜色生成图片
public func getImageWithColor(_ color:UIColor)->UIImage{
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
