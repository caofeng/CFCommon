//
//  ViewController.swift
//  CFCommon
//
//  Created by caofeng on 11/06/2019.
//  Copyright (c) 2019 caofeng. All rights reserved.
//

import UIKit
import CFCommon


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = setNavBarButton("购物车", .red, .blue, regularFont(15), nil, nil, .left, 10, complete: {[weak self] in
            NSLog("左边")
            self?.showHudWithText("网络异常,稍后再试")
        })
        
        navigationItem.rightBarButtonItem = setNavBarButton("我的", .right, 10, complete: {[weak self] in
            NSLog("右边")
            self?.showHudWithTextLoading("加载中...")
        })
        
        let button = UIButton("点我", .red, regularFont(20), view)
        button.backgroundColor = .blue
        button.center = view.center
        button.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.cf_setEnlargeEdge(30, 10, 0, 30)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
    }
  
    @objc func buttonClick() {
        NSLog("00000000000000000")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

