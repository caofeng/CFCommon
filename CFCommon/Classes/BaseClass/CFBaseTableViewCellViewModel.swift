//
//  CFBaseTableViewCellViewModel.swift
//  CFCommon
//
//  Created by Topband on 2019/12/4.
//

import UIKit

public class CFBaseTableViewCellViewModel: NSObject {

    public var height:CGFloat = 44.0
    public var separatorLeftInset:CGFloat = 12
    public var separatorRightInset:CGFloat = 0
    public var selectionStyle:UITableViewCell.SelectionStyle = .default
    public override init() {
        super.init()
        commonInit()
    }
    public func commonInit(){
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
        NSLog("==========\(self.classForCoder)===========")
    }
}
