//
//  CFLoadingView.swift
//  CFCommon
//
//  Created by Topband on 2019/12/4.
//

import UIKit

public class CFLoadingView: CFBaseView {

    public var loadingLabel:UILabel!
    public var loadingActivity:UIActivityIndicatorView!
    
    public override func setupViews() {
        
        loadingLabel = UILabel("拼命加载中...", .gray, regularFont(18), self)
        loadingActivity = UIActivityIndicatorView(style: .gray)
        loadingActivity.hidesWhenStopped = true
        addSubview(loadingActivity)
        loadingActivity.startAnimating()
        
    }
    
    public override func setupConstraints() {
    
        loadingLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(20)
        }
        
        loadingActivity.snp.makeConstraints { (make) in
            make.centerY.equalTo(loadingLabel)
            make.right.equalTo(loadingLabel.snp.left).offset(-5)
        }
    }
}
