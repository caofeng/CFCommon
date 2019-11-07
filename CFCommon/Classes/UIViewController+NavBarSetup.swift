//
//  UIViewController+NavBarSetup.swift
//  CFCommon
//
//  Created by Topband on 2019/11/7.
//

import Foundation

fileprivate let defaultColor = UIColor.red
fileprivate let defaultFont = regularFont(20)
fileprivate let defaultHighlightColor = UIColor.red

fileprivate var handleLeftKey = 1000000
fileprivate var handleRightKey = 1000001

public enum NavBarButtonItemType {
    case left
    case right
}

public extension UIViewController {
    
    fileprivate var complete:(()->Void)? {
        
        set {
            objc_setAssociatedObject(self, &handleLeftKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            if let handle = objc_getAssociatedObject(self, &handleLeftKey) as? (()->Void) {
                return handle
            }
            return nil
        }
    }
    
    fileprivate var complete_:(()->Void)? {
        
        set {
            objc_setAssociatedObject(self, &handleRightKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            if let handle = objc_getAssociatedObject(self, &handleRightKey) as? (()->Void) {
                return handle
            }
            return nil
        }
    }
    
    /**
     标题
     */
    func setNavBarButton(_ title:String?,_ type:NavBarButtonItemType?,complete:@escaping()->Void) -> UIBarButtonItem {
        return setNavBarButton(title, type, 0, complete: complete)
    }
    /**
     标题,边距
     */
    func setNavBarButton(_ title:String?,_ type:NavBarButtonItemType?,_ leftOrRightPadding:CGFloat?,complete:@escaping()->Void) -> UIBarButtonItem {
        return setNavBarButton(title, defaultColor,defaultHighlightColor, defaultFont, type, leftOrRightPadding, complete: complete)
    }
    /**
     标题，颜色，字号，边距
     */
    func setNavBarButton(_ title:String?,_ color:UIColor?,_ highLightColor:UIColor?,_ font:UIFont?,_ type:NavBarButtonItemType?,_ leftOrRightPadding:CGFloat?,complete:@escaping()->Void) -> UIBarButtonItem {
         return setNavBarButton(title, color, highLightColor, font, nil, nil, type, leftOrRightPadding, complete: complete)
    }
    
    /**
    图片，边距
    */
    func setNavBarButton(_ image:UIImage?,_ highlightImage:UIImage?,_ type:NavBarButtonItemType?,_ leftOrRightPadding:CGFloat?,complete:@escaping()->Void) -> UIBarButtonItem {
        return setNavBarButton(nil, nil, nil, nil, image, highlightImage, type, leftOrRightPadding, complete: complete)
    }
    /**
    标题，颜色，字号，图片，边距
    */
    func setNavBarButton(_ title:String?,_ color:UIColor?,_ highLightColor:UIColor?,_ font:UIFont?,_ image:UIImage?,_ highlightImage:UIImage?,_ type:NavBarButtonItemType?,_ leftOrRightPadding:CGFloat?,complete:@escaping()->Void) -> UIBarButtonItem {
        let textColor = color ?? defaultColor
        let textFont = font ?? defaultFont
        let highlightColor = highLightColor ?? defaultHighlightColor
        let type_ = type ?? .left
        setNavBarHidden(type_)
        
        /**
        1. 只有文字
        2. 只有图片
        3. 文字和图片
        */
        let height = 44.0
        var width = 44.0
        
        let button = UIButton(type: .custom)
        if image == nil && title != nil {
            button.setTitle(title, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.setTitleColor(highlightColor, for: .highlighted)
            button.titleLabel?.font = textFont
            width = Double(NSString(string: title!).size(withAttributes: [NSAttributedString.Key.font:textFont]).width + 10)
        } else if title == nil && image != nil {
            
            button.setImage(image, for: .normal)
            button.setImage(highlightImage, for: .highlighted)
            width = Double((image?.size.width)! + 10)
            
        } else if title != nil && image != nil {
            
            button.setTitle(title, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.setTitleColor(highlightColor, for: .highlighted)
            button.titleLabel?.font = textFont
            button.setImage(image, for: .normal)
            button.setImage(highlightImage, for: .highlighted)
            width = Double((image?.size.width)! + 10)
            width = width + Double(NSString(string: title!).size(withAttributes: [NSAttributedString.Key.font:textFont]).width)
        }
        
        button.frame = CGRect(x: 0, y: 0, width: width, height: height)

        if type_ == NavBarButtonItemType.left {
            self.complete = complete
            button.addTarget(self, action: #selector(handlerLeft), for: .touchUpInside)
        } else {
            self.complete_ = complete
            button.addTarget(self, action: #selector(handlerRight), for: .touchUpInside)
        }
        let barItem = UIBarButtonItem(customView: button)
        
        return barItem
    }
    
    /**
     隐藏NavBar
     */
    
    func setNavBarHidden(_ type:NavBarButtonItemType?) {
        if type == .left {
            navigationItem.leftBarButtonItem = nil
            navigationItem.leftBarButtonItems = []
        } else {
            navigationItem.rightBarButtonItem = nil
            navigationItem.rightBarButtonItems = []
        }
    }
        
    @objc fileprivate func handlerLeft(){
        guard complete != nil else {
            return
        }
        complete!()
    }
    @objc fileprivate func handlerRight(){
        guard complete_ != nil else {
            return
        }
        complete_!()
    }
     
}







