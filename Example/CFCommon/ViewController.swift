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
        
        navigationItem.leftBarButtonItem = setNavBarButton("购物车", .red, .blue, regularFont(15), nil, nil, .left, 10, complete: {
            NSLog("左边")
        })
        
        navigationItem.rightBarButtonItem = setNavBarButton("我的", .right, 10, complete: {[weak self] in
            NSLog("右边")
            let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
            self?.navigationController?.pushViewController(vc, animated: true)
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

