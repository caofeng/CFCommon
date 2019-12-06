//
//  CFNetworkErrorView.swift
//  CFCommon
//
//  Created by Topband on 2019/12/4.
//

import UIKit

public class CFNetworkErrorView: CFBaseView {

    public var errorLabel:UILabel!

    public override func setupViews() {
        errorLabel = UILabel("网络异常，点击重试", .gray, regularFont(18), self)
    }
    
    public override func setupConstraints() {
        errorLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

   
}
