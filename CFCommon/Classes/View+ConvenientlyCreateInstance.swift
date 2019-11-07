//
//  View+ConvenientlyCreateInstance.swift
//  CFCommon
//
//  Created by Topband on 2019/11/6.
//

import Foundation

public extension UIView {
    
    convenience init(_ backgroundColor:UIColor?,_ superView:UIView?) {
        self.init()
        self.backgroundColor = backgroundColor
        superView?.addSubview(self)
    }
    
    /// UIView 加边框
    func tb_addBorder(_ borderWidth:CGFloat,_ borderColor:UIColor) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    /// UIView 切圆角
    func tb_cornerRadius(_ radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    /// 完整约束之后计算View高度
    func calculateViewSize() -> CGSize {
        self.layoutIfNeeded()
        self.setNeedsLayout()
       return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
}

public extension UILabel {
    
    /**
     @param text 文本
     @param textColor 颜色
     @param textFont  字号
     @param textAlignment 对齐方式
     @param numberOfLines 行数
     @param superView 父视图
     */
    convenience init(_ text:String?,_ textColor:UIColor?,_ textFont:UIFont?,_ textAlignment:NSTextAlignment,_ numberOfLines:Int,_ superView:UIView?) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = textFont
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        superView?.addSubview(self)
    }
    
    /**
    @param text 文本
    @param textColor 颜色
    @param textFont  字号
    @param superView 父视图
    */
    convenience init(_ text:String?,_ textColor:UIColor?,_ textFont:UIFont?,_ superView:UIView?) {
        self.init()        
        self.text = text
        self.textColor = textColor
        self.font = textFont
        superView?.addSubview(self)
    }
}

public extension UIButton {
    
    convenience init(_ title:String?,_ titleColor:UIColor?,_ titleFont:UIFont?,_ imageName:String?,_ highlightImageName:String?,_ bgImageName:String?,_ bgHighlightImageName:String?,_ bgColor:UIColor?,_ bgHighlightColor:UIColor?,_ superView:UIView?,_ imageBundle:Bundle = Bundle.main) {
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        if imageName?.count ?? 0 > 0 {
            setImage(UIImage(named: imageName ?? "", in: imageBundle, compatibleWith: nil), for: .normal)
        }
        if highlightImageName?.count ?? 0 > 0 {
            setImage(UIImage(named: highlightImageName ?? "", in: imageBundle, compatibleWith: nil), for: .highlighted)
        }
        if bgImageName?.count ?? 0 > 0 {
            setBackgroundImage(UIImage(named: bgImageName ?? "", in: imageBundle, compatibleWith: nil), for: .normal)
        }
        if bgHighlightImageName?.count ?? 0 > 0 {
            setBackgroundImage(UIImage(named: bgHighlightImageName ?? "", in: imageBundle, compatibleWith: nil), for: .highlighted)
        }
        if bgColor != nil {
            setBackgroundImage(getImageWithColor(bgColor!), for: .normal)
        }
        if bgHighlightColor != nil {
            setBackgroundImage(getImageWithColor(bgHighlightColor!), for: .highlighted)
        }
        superView?.addSubview(self)
    }
    
    
    convenience init(_ title:String?,_ titleColor:UIColor?,_ titleFont:UIFont?,_ superView:UIView?) {
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        superView?.addSubview(self)
    }
    
    convenience init(_ title:String?,_ titleColor:UIColor?,_ titleFont:UIFont?,_ imageName:String?,_ highlightImageName:String?,_ superView:UIView?,_ imageBundle:Bundle = Bundle.main) {
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        if imageName?.count ?? 0 > 0 {
            setImage(UIImage(named: imageName ?? "", in: imageBundle, compatibleWith: nil), for: .normal)
        }
        if highlightImageName?.count ?? 0 > 0 {
            setImage(UIImage(named: highlightImageName ?? "", in: imageBundle, compatibleWith: nil), for: .highlighted)
        }
        superView?.addSubview(self)
    }
    
    convenience init(_ title:String?,_ titleColor:UIColor?,_ titleFont:UIFont?,_ imageName:String?,_ highlightImageName:String?,_ bgImageName:String?,_ bgHighlightImageName:String?,_ superView:UIView?,_ imageBundle:Bundle = Bundle.main) {
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        if imageName?.count ?? 0 > 0 {
            setImage(UIImage(named: imageName ?? "", in: imageBundle, compatibleWith: nil), for: .normal)
        }
        if highlightImageName?.count ?? 0 > 0 {
            setImage(UIImage(named: highlightImageName ?? "", in: imageBundle, compatibleWith: nil), for: .highlighted)
        }
        if bgImageName?.count ?? 0 > 0 {
            setBackgroundImage(UIImage(named: bgImageName ?? "", in: imageBundle, compatibleWith: nil), for: .normal)
        }
        if bgHighlightImageName?.count ?? 0 > 0 {
            setBackgroundImage(UIImage(named: bgHighlightImageName ?? "", in: imageBundle, compatibleWith: nil), for: .highlighted)
        }
        superView?.addSubview(self)
    }
    
    convenience init(_ title:String?,_ titleColor:UIColor?,_ titleFont:UIFont?,_ imageName:String?,_ highlightImageName:String?,_ bgColor:UIColor?,_ bgHighlightColor:UIColor?,_ superView:UIView?,_ imageBundle:Bundle = Bundle.main) {
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        if imageName?.count ?? 0 > 0 {
            setImage(UIImage(named: imageName ?? "", in: imageBundle, compatibleWith: nil), for: .normal)
        }
        if highlightImageName?.count ?? 0 > 0 {
            setImage(UIImage(named: highlightImageName ?? "", in: imageBundle, compatibleWith: nil), for: .highlighted)
        }
        if bgColor != nil {
            setBackgroundImage(getImageWithColor(bgColor!), for: .normal)
        }
        if bgHighlightColor != nil {
            setBackgroundImage(getImageWithColor(bgHighlightColor!), for: .highlighted)
        }
        superView?.addSubview(self)
    }
}

public extension UIImageView {
    convenience init(_ name:String,_ contentMode:UIView.ContentMode = .scaleToFill,_ superView:UIView?,_ imageBundle:Bundle = Bundle.main) {
        self.init()
        image = UIImage(named: name, in: imageBundle, compatibleWith: nil)
        self.contentMode = contentMode
        superView?.addSubview(self)
    }
}

public extension UITextField {
    
    convenience init(_ textColor:UIColor?,_ textFont:UIFont?,_ borderStyle:UITextField.BorderStyle = .none,_ isSecureText:Bool = false,_ placeholder:String?,_ attrbutedPlaceholder:NSAttributedString?,_ superView:UIView?) {
        self.init()
        self.textColor = textColor
        self.font = textFont
        self.borderStyle = borderStyle
        self.isSecureTextEntry = isSecureText
        self.placeholder = placeholder
        superView?.addSubview(self)
        guard attrbutedPlaceholder == nil else {
            self.attributedPlaceholder = attrbutedPlaceholder
            return
        }
    }    
}

