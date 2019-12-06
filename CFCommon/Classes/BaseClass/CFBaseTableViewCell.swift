//
//  CFBaseTableViewCell.swift
//  CFCommon
//
//  Created by Topband on 2019/12/4.
//

import UIKit

public class CFBaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
