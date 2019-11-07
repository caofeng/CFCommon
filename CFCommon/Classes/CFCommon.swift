//
//  CFCommon.swift
//  CFCommon
//
//  Created by Topband on 2019/11/6.
//

import Foundation

public func NSLog<T>(_ msg : T, file : String = #file, lineNumber : Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName): line: \(lineNumber)] \(msg)")
    #endif
}

/// 操作系统版本判断 ---------------------------
public let IOS_VERSION_10_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 10
public let IOS_VERSION_11_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 11
public let IOS_VERSION_12_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 12
public let IOS_VERSION_13_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 13
public let IOS_VERSION_14_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 14

/// 手机屏幕参数判断 -----------------------------
public let iPhoneScale = UIScreen.main.scale
public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height
public let iPhone_X_S = CheckiPhone_X_S()

public let kStatusBarHeight:CGFloat = iPhone_X_S ? 44.0:20.0
public let kNavBarHeight:CGFloat = 44.0
public let kStatusAndNavBarHeight:CGFloat = (kStatusBarHeight + kNavBarHeight)
public let kTabbarHeight:CGFloat = iPhone_X_S ? 83:49
public let kBottomMargin:CGFloat = iPhone_X_S ? 34:0
public let kTopMargin:CGFloat = iPhone_X_S ? 24:0

fileprivate func CheckiPhone_X_S() -> Bool {
    if let window:UIWindow = UIApplication.shared.delegate?.window ?? nil {
        if #available(iOS 11.0, *) {
            return (window.safeAreaInsets.bottom > 0)
        } else {
            // Fallback on earlier versions
            return false
        }
    }
    return false
}








