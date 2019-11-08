//
//  UIControl+EnlargeEdge.swift
//  CFCommon
//
//  Created by Topband on 2019/11/8.
//

import Foundation

fileprivate var topNameKey = 1000004
fileprivate var leftNameKey = 1000005
fileprivate var bottomNameKey = 1000006
fileprivate var rightNameKey = 1000007

public extension UIControl {
    
    func cf_setEnlargeEdge(_ top:CGFloat,_ left:CGFloat,_ bottom:CGFloat,_ right:CGFloat) {
        objc_setAssociatedObject(self, &topNameKey, top, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &leftNameKey, left, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &bottomNameKey, bottom, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &rightNameKey, right, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let rect = cf_enlargedRect()
        if rect.equalTo(self.bounds) {
            return super.hitTest(point, with: event)
        } else {
            if self.isHidden || self.alpha == 0 || !self.isUserInteractionEnabled || !self.isEnabled {
                return super.hitTest(point, with: event)
            }
            if rect.contains(point) {
                return self
            } else {
                return nil
            }
        }
    }
    
    
    fileprivate func cf_enlargedRect() -> CGRect {
        if let top = objc_getAssociatedObject(self, &topNameKey) as? CGFloat,
            let left = objc_getAssociatedObject(self, &leftNameKey) as? CGFloat,
            let bottom = objc_getAssociatedObject(self, &bottomNameKey) as? CGFloat,
            let right = objc_getAssociatedObject(self, &rightNameKey) as? CGFloat
            
        {
           return CGRect(x: self.bounds.origin.x - left, y: self.bounds.origin.y - top, width: self.bounds.size.width + left + right, height: self.bounds.size.height + top + bottom)
        }
        return self.bounds
    }
}


fileprivate var imageTopNameKey = 1000008
fileprivate var imageLeftNameKey = 1000009
fileprivate var imageBottomNameKey = 10000010
fileprivate var imageRightNameKey = 10000011

public extension UIImageView {
    
    func cf_setEnlargeEdge(_ top:CGFloat,_ left:CGFloat,_ bottom:CGFloat,_ right:CGFloat) {
        objc_setAssociatedObject(self, &imageTopNameKey, top, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &imageLeftNameKey, left, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &imageBottomNameKey, bottom, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &imageRightNameKey, right, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let rect = cf_enlargedRect()
        if rect.equalTo(self.bounds) {
            return super.hitTest(point, with: event)
        } else {
            if self.isHidden || self.alpha == 0 || !self.isUserInteractionEnabled {
                return super.hitTest(point, with: event)
            }
            if rect.contains(point) {
                return self
            } else {
                return nil
            }
        }
    }
    
    
    fileprivate func cf_enlargedRect() -> CGRect {
        if let top = objc_getAssociatedObject(self, &imageTopNameKey) as? CGFloat,
            let left = objc_getAssociatedObject(self, &imageLeftNameKey) as? CGFloat,
            let bottom = objc_getAssociatedObject(self, &imageBottomNameKey) as? CGFloat,
            let right = objc_getAssociatedObject(self, &imageRightNameKey) as? CGFloat
            
        {
           return CGRect(x: self.bounds.origin.x - left, y: self.bounds.origin.y - top, width: self.bounds.size.width + left + right, height: self.bounds.size.height + top + bottom)
        }
        return self.bounds
    }
}


fileprivate var labelTopNameKey = 10000012
fileprivate var labelLeftNameKey = 10000013
fileprivate var labelBottomNameKey = 10000014
fileprivate var labelRightNameKey = 10000015

public extension UILabel {
    
    func cf_setEnlargeEdge(_ top:CGFloat,_ left:CGFloat,_ bottom:CGFloat,_ right:CGFloat) {
        objc_setAssociatedObject(self, &labelTopNameKey, top, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &labelLeftNameKey, left, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &labelBottomNameKey, bottom, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        objc_setAssociatedObject(self, &labelRightNameKey, right, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let rect = cf_enlargedRect()
        if rect.equalTo(self.bounds) {
            return super.hitTest(point, with: event)
        } else {
            if self.isHidden || self.alpha == 0 || !self.isUserInteractionEnabled {
                return super.hitTest(point, with: event)
            }
            if rect.contains(point) {
                return self
            } else {
                return nil
            }
        }
    }
    
    
    fileprivate func cf_enlargedRect() -> CGRect {
        if let top = objc_getAssociatedObject(self, &labelTopNameKey) as? CGFloat,
            let left = objc_getAssociatedObject(self, &labelLeftNameKey) as? CGFloat,
            let bottom = objc_getAssociatedObject(self, &labelBottomNameKey) as? CGFloat,
            let right = objc_getAssociatedObject(self, &labelRightNameKey) as? CGFloat
            
        {
           return CGRect(x: self.bounds.origin.x - left, y: self.bounds.origin.y - top, width: self.bounds.size.width + left + right, height: self.bounds.size.height + top + bottom)
        }
        return self.bounds
    }
}
