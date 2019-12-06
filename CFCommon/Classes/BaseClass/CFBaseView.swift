//
//  CFBaseView.swift
//  CFCommon
//
//  Created by Topband on 2019/12/4.
//

import UIKit

public class CFBaseView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = RGB(255, 255, 255)
        setupViews()
        setupConstraints()
        setupEvents()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setupViews(){
        
    }
    
    public func setupConstraints(){
        
    }
    
    public func setupEvents(){
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        NSLog("==========\(self.classForCoder)===========")
    }
}
