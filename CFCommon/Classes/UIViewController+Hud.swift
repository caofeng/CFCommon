//
//  UIViewController+Hud.swift
//  CFCommon
//
//  Created by Topband on 2019/11/8.
//

import Foundation

fileprivate var hudViewKey = 1000002
fileprivate var hudShowKey = 1000003

public enum HUDType {
    case text
    case loading
    case textLoading
}

public extension UIViewController {
    
    
    fileprivate var hudView:UIView? {
        set {
            objc_setAssociatedObject(self, &hudViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let handle = objc_getAssociatedObject(self, &hudViewKey) as? UIView {
                return handle
            }
            return nil
        }
    }
    
    /// 是否正在显示 Hud
    fileprivate var isShowHud:Bool {
        set{
            objc_setAssociatedObject(self, &hudShowKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        get{
            if let handle = objc_getAssociatedObject(self, &hudShowKey) as? Bool {
                return handle
            }
            return false
        }
    }
    
    /// 文本
    func showHudWithText(_ text:String,_ textColor:UIColor = .white,_ duration:TimeInterval = 2,_ leftOrRightPadding:CGFloat = 10,_ topOrBottomPadding:CGFloat = 8,_ cornerRadius:CGFloat = 8,_ font:UIFont = regularFont(17)) {
        showHud(.text, text, textColor, duration, leftOrRightPadding, topOrBottomPadding, cornerRadius, font)
    }
    
    /// loading
    func showHudWithLoading(_ leftOrRightPadding:CGFloat = 10,_ topOrBottomPadding:CGFloat = 8,_ cornerRadius:CGFloat = 8) {
        
        showHud(.loading, nil, nil, Double(LONG_MAX), leftOrRightPadding, topOrBottomPadding, cornerRadius, regularFont(17))
    }
    
    /// 文本和loading
    func showHudWithTextLoading(_ text:String,_ textColor:UIColor = .white,_ leftOrRightPadding:CGFloat = 10,_ topOrBottomPadding:CGFloat = 8,_ cornerRadius:CGFloat = 8,_ font:UIFont = regularFont(17)) {
        showHud(.textLoading, text, textColor, Double(LONG_MAX), leftOrRightPadding, topOrBottomPadding, cornerRadius, font)
    }
    
    /// 取消Hud
    func hiddenHud() {
        for sub in hudView?.subviews ?? [] {
            sub.removeFromSuperview()
        }
        hudView?.removeFromSuperview()
        hudView = nil
        isShowHud = false
    }
    
    fileprivate func showHud(_ type:HUDType,_ text:String?,_ textColor:UIColor? = .white,_ duration:TimeInterval = Double(LONG_MAX),_ leftOrRightPadding:CGFloat = 10,_ topOrBottomPadding:CGFloat = 8,_ cornerRadius:CGFloat = 8,_ font:UIFont = regularFont(17)) {
        guard !isShowHud else {
            return
        }
        hudView = UIView(RGBH(0, 0, 0, 0.001), view)
        hudView?.center = view.center
        hudView?.bounds = view.bounds
        if type == .text {
            DispatchQueue.main.asyncAfter(deadline: .now()+duration) {
                self.hiddenHud()
            }
        }
        guard hudView != nil else {
            return
        }
        var wapperWidth:CGFloat = 70
        var wapperHeight:CGFloat = 70
        let wapperView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        hudView?.addSubview(wapperView)
        wapperView.contentView.backgroundColor = .clear
        wapperView.backgroundColor = .black
        wapperView.center = hudView!.center
        wapperView.tb_cornerRadius(cornerRadius)
        wapperView.alpha = 0
        UIView.animate(withDuration: 0.2) {
            wapperView.alpha = 1
        }
        
        if type == .text {
            
            let rect = NSString(string: text!).boundingRect(with: CGSize(width: hudView!.frame.width-30-2*leftOrRightPadding, height: 0), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil)
            
            wapperHeight = rect.height + 2*topOrBottomPadding
            wapperWidth = rect.width + 2*leftOrRightPadding
            
            let label = createLabel(font,text,textColor,wapperView.contentView)
            label.frame = CGRect(x: leftOrRightPadding, y: topOrBottomPadding, width: rect.width, height: rect.height)
            
        } else if type == .textLoading {
            
            wapperHeight = 50
            wapperWidth = 50
            
            let rect = NSString(string: text!).boundingRect(with: CGSize(width: hudView!.frame.width-30-2*leftOrRightPadding, height: 0), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil)
            
            let tempWidth = rect.width + 2*leftOrRightPadding
            wapperHeight = rect.height + 2*topOrBottomPadding + wapperHeight
            if tempWidth > wapperWidth {
                wapperWidth = tempWidth
            }
            if wapperWidth < wapperHeight {
                wapperWidth = wapperHeight
            }
            
            let label = createLabel(font,text,textColor,wapperView.contentView)
            label.frame = CGRect(x: (tempWidth-rect.width)/2, y: 50+topOrBottomPadding, width: rect.width, height: rect.height)
            var loadingView:UIActivityIndicatorView!
            if #available(iOS 13.0, *) {
                loadingView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            } else {
                loadingView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            }
            hudView?.addSubview(loadingView)
            loadingView.center = CGPoint(x: hudView!.center.x, y: hudView!.center.y - wapperHeight/2 + 30)
            loadingView.startAnimating()

        } else {
            
            var loadingView:UIActivityIndicatorView!
            if #available(iOS 13.0, *) {
                loadingView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            } else {
                loadingView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            }
            loadingView.center = wapperView.center
            hudView?.addSubview(loadingView)
            loadingView.startAnimating()
        }
        isShowHud = true
        wapperView.bounds = CGRect(x: 0, y: 0, width: wapperWidth, height: wapperHeight)
    }
    
    fileprivate func createLabel(_ font:UIFont,_ text:String?,_ textColor:UIColor?, _ supView:UIView)-> UILabel {
        return UILabel(text, textColor, font, .center, 0, supView)
    }
    
}




