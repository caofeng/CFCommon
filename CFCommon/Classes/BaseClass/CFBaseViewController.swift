//
//  CFBaseViewController.swift
//  CFCommon
//
//  Created by Topband on 2019/12/4.
//

import UIKit
import SnapKit
import FDFullscreenPopGesture

open class CFBaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    public var contentView:UIView!
    public var viewModel:CFBaseViewModel!
    
    fileprivate var isFirstLoadData:Bool = true
    fileprivate var loading:Bool = true

    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        edgesForExtendedLayout = .all
        extendedLayoutIncludesOpaqueBars = true
        automaticallyAdjustsScrollViewInsets = false
        view.frame = UIScreen.main.bounds
        view.backgroundColor = RGB(255, 255, 255)
        self.title = viewModel.title
        
        setupNavigation()
        setupViews()
        setupConstraints()
        setupEvents()        
        
        loadAction()
    }
    
    fileprivate func loadAction(){
        
        var loadingView:CFLoadingView?
        var topMargin = kStatusAndNavBarHeight
        if fd_prefersNavigationBarHidden {
            topMargin = 0
        }
        if isFirstLoadData {
            loadingView = CFLoadingView()
            view.addSubview(loadingView!)
            loadingView?.snp.makeConstraints({ (make) in
                make.left.bottom.right.equalTo(0)
                make.top.equalTo(topMargin)
            })
        }
        
        sendNetworkRequest {[weak self] (isSucc, message) in
            loadingView?.removeFromSuperview()
            
            guard isSucc else {
                if self?.isFirstLoadData ?? false {
                    let errorView = CFNetworkErrorView()
                    self?.view.addSubview(errorView)
                    errorView.snp.makeConstraints { (make) in
                        make.left.bottom.right.equalTo(0)
                        make.top.equalTo(topMargin)
                    }
                    let tap = UITapGestureRecognizer(target: self, action: #selector(self?.againload))
                    errorView.addGestureRecognizer(tap)
                }
                self?.showHudWithText(message ?? "网络异常")
                return
            }
            self?.isFirstLoadData = false
            if self?.viewModel.openRefresh ?? false {
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc func againload(){
        for view_ in view.subviews {
            if view_.isKind(of: CFNetworkErrorView.classForCoder()) {
                view_.removeFromSuperview()
            }
        }
        loadAction()
    }
    
    // MARK: - 网络请求
    open func sendNetworkRequest(complement:@escaping(_ isSuccess:Bool,_ message:String?)->Void) {
        // 子类重写
    }
    
    /// 在此设置 导航栏 隐藏与否 以及 NavigationBar
    open func setupNavigation(){
        
        
    }
    
    // MARK: - InitView
    open func setupViews(){
        contentView = UIView(RGB(255, 255, 255), view)
        if viewModel.openRefresh {
            contentView.addSubview(tableView)
            tableView.snp.makeConstraints { (make) in
                make.left.bottom.right.equalTo(0)
                make.top.equalTo(0)
            }
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    open func setupConstraints(){
        var contentViewTopMargin = kStatusAndNavBarHeight
        if fd_prefersNavigationBarHidden {
            contentViewTopMargin = 0
        }
        contentView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(contentViewTopMargin)
        }
    }
    
    open func setupEvents(){
        
        
    }
    
    // MARK: - TabelView
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.dataArray[indexPath.row]
        cell.selectionStyle = cellViewModel.selectionStyle
        cell.separatorInset = UIEdgeInsets(top: 0, left: cellViewModel.separatorLeftInset, bottom: 0, right: cellViewModel.separatorRightInset)
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellViewModel = viewModel.dataArray[indexPath.row]
        return cellViewModel.height
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public var tableView:UITableView = {
        
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .clear
        table.separatorStyle = .singleLine
        table.cellLayoutMarginsFollowReadableWidth = false
        table.separatorColor = RGB(230,229,228)
        if #available(iOS 11.0, *) {
            table.contentInsetAdjustmentBehavior = .never
            table.estimatedRowHeight = 0;
            table.estimatedSectionHeaderHeight = 0;
            table.estimatedSectionFooterHeight = 0;
        } else {
            // Fallback on earlier versions
        }
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kBottomMargin, right: 0)
        table.tableFooterView = UIView(frame: .zero)
        return table
    }()

    deinit {
        NotificationCenter.default.removeObserver(self)
        NSLog("==========\(self.classForCoder)===========")
    }
}
