//
//  HomeViewController.swift
//  CFCommon_Example
//
//  Created by Topband on 2019/12/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import CFCommon

class HomeViewController: CFBaseViewController {

    var vm:HomeViewModel {
        get{
            return viewModel as! HomeViewModel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(vm.name)
        
        
    }
    
    override func sendNetworkRequest(complement: @escaping (Bool, String?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            complement(true,"网络异常")
        }
    }

    override func setupNavigation() {
//        fd_prefersNavigationBarHidden = true
    }

}
