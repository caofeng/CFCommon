//
//  HomeViewController.swift
//  CFCommon_Example
//
//  Created by Topband on 2019/11/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import CFCommon

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = setNavBarButton("返回", .left, 10, complete: {[weak self] in
            NSLog("hahhaahha")
            self?.navigationController?.popViewController(animated: true)
        })
    }

    deinit {
        NSLog(" ========= \(self.classForCoder) deinit ========== ")
    }

}
