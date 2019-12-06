//
//  CFBaseViewModel.swift
//  CFCommon
//
//  Created by Topband on 2019/12/4.
//

import UIKit

open class CFBaseViewModel: NSObject {

    public var title = ""
    public var dataArray:[CFBaseTableViewCellViewModel] = []
    /// 是否需要下拉刷新--如果打开会自带一个tableView
    public var openRefresh:Bool = false
    
    public override init() {
        super.init()
        commonInit()
    }
    open func commonInit() {
        dataArray.removeAll()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        NSLog("==========\(self.classForCoder)===========")
    }
}
