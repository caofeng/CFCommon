//
//  HomeViewModel.swift
//  CFCommon_Example
//
//  Created by Topband on 2019/12/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import CFCommon

class HomeViewModel: CFBaseViewModel {

    var name:String = "曹峰"
    override func commonInit() {
        super.commonInit()
        title = "家庭"
        openRefresh = true
    }
    
}
