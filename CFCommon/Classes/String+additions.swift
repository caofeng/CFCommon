//
//  String+additions.swift
//  CFCommon
//
//  Created by Topband on 2019/11/6.
//

import Foundation

//-----------------------字符串---------------------

/*
 中文：[^\\u4E00-\\u9FA5]
 英文：[^A-Za-z]
 数字：[^0-9]
 中文或英文：[^A-Za-z\\u4E00-\\u9FA5]
 英文或数字：[^A-Za-z0-9]
 英文或数字或下划线：[^A-Za-z0-9_]
 */

/// 数字
public func checkOnlyNumTextField(_ textFiled:UITextField,_ maxLength:Int = Int.max) {
    checkTextFiled(textFiled, "[^0-9]", maxLength)
}

/// 字母
public func checkOnlyAlphaTextField(_ textFiled:UITextField,_ maxLength:Int = Int.max) {
    checkTextFiled(textFiled, "[^A-Za-z]", maxLength)
}

/// 数字，字母
public func checkNumAndAlphaTextField(_ textFiled:UITextField,_ maxLength:Int = Int.max) {
    checkTextFiled(textFiled, "[^A-Za-z0-9]", maxLength)
}

/// Email 格式
public func checkOnlyEmailTextField(_ textFiled:UITextField,_ maxLength:Int = Int.max) {
    checkTextFiled(textFiled, "[^A-Za-z0-9.@_-]", maxLength)
}
/// 仅汉字
public func checkOnlyChineseTextField(_ textFiled:UITextField,_ maxLength:Int = Int.max) {
    checkTextFiled(textFiled, "[^\\u4E00-\\u9FA5]", maxLength)
}
/// 除表情外其他任意字符
public func checkExceptEmojiTextField(_ textField:UITextField,_ maxLength:Int = Int.max) {
    var text = textField.text
    if text?.count ?? 0 > maxLength {
        text = String(text?.prefix(maxLength) ?? "")
    }
    textField.text = text?.removeEmoji()
}

func checkTextFiled(_ textFiled:UITextField,_ regx:String, _ maxLength:Int = Int.max) {
    
    guard let _: UITextRange = textFiled.markedTextRange else {
        let cursorPostion = textFiled.offset(from: textFiled.endOfDocument,
                                             to: textFiled.selectedTextRange!.end)
        let pattern = regx
        var str = textFiled.text!.pregReplace(pattern: pattern, with: "")
        if str.count > maxLength {
            str = String(str.prefix(maxLength))
        }
        textFiled.text = str
        let targetPostion = textFiled.position(from: textFiled.endOfDocument,
                                               offset: cursorPostion)!
        textFiled.selectedTextRange = textFiled.textRange(from: targetPostion,
                                                          to: targetPostion)
        return
    }
}


extension String {
    
    func pregReplace(pattern: String, with: String,
                     options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSMakeRange(0, self.count),
                                              withTemplate: with)
    }
    
    /// 移除字符串中的表情符号，返回一个新的字符串
    fileprivate func removeEmoji() -> String {
        return self.reduce("") {
            if $1.isEmoji {
                return $0 + ""
            } else {
                return $0 + String($1)
            }
        }
    }
}

extension Character {
    
    var isEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF, // Misc symbols
        0x2700...0x27BF, // Dingbats
        0xE0020...0xE007F, // Tags
        0xFE00...0xFE0F, // Variation Selectors
        0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
        127000...127600, // Various asian characters
        65024...65039, // Variation selector
        9100...9300, // Misc items
        8400...8447: // Combining Diacritical Marks for Symbols
            return true
        default:
            return false
        }
    }
}







