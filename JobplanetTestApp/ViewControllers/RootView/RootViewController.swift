//
//  RootViewController.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import Foundation
import UIKit

class RootViewController : UIViewController
{
    @IBOutlet weak var tvLists: UITableView!
    
    public var searchBarController : UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Company"
        return searchController
    }()
    
    public var viewModel : RootViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInit()
        self.dataInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
        NSLog("\(#fileID) deinit")
    }
    
    private func commonInit() {
        //search bar setting
        self.searchBarController.searchResultsUpdater = self
        definesPresentationContext = true// 다른 뷰 컨트롤러로 이동하면 search bar가 화면에 남지 않도록 한다
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = self.searchBarController
        }else{
            self.navigationItem.titleView = self.searchBarController.searchBar
        }
        
        //table view setting
        self.tvLists.delegate = self
        self.tvLists.dataSource = self
        self.tvLists.rowHeight = UITableView.automaticDimension//.leastNonzeroMagnitude
        self.tvLists.estimatedRowHeight = 100
        self.tvLists.separatorStyle = .none
        /*
        //cell type이 두가지이다. 하나는 horizontal로 움직이는 collectionview를 contain하고있는 cell, 다른 하나는 company들의 정보를 보여주는 cell.
         */
        let cellResultNib = UINib(nibName: "ResultTableViewCell", bundle: nil)
        self.tvLists.register(cellResultNib, forCellReuseIdentifier: "ResultTableViewCell")
        
    }
    
    
    public func dataInit() {
        //view model binding을 여기서 한다.
        
        self.viewModel.getDataComplete = {[weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.tvLists.reloadData()
        }
        
        self.viewModel.getDataError = {[weak self] _ in
            guard let _ = self else {
                return
            }
            //error 온 경우 처리하기 위한 부분.
        }
        
        self.viewModel.filterComplete = {[weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.tvLists.reloadData()
        }
        
        self.viewModel.getDatas(str: nil, type: nil)
    }
}

