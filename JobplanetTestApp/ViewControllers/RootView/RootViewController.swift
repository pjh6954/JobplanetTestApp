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
    
    public var defaultDataResponse : searchResponseModel = .init()
    public var horizontalResult : [searchItem] = [] // only horizontal
    public var nonHorizontalResult : [searchItem] = [] // company and reviews
    
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
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Company"
        definesPresentationContext = true // 다른 뷰 컨트롤러로 이동하면 search bar가 화면에 남지 않도록 한다.
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
        }else{
            self.navigationItem.titleView = searchController.searchBar
        }
        
        //table view setting
        self.tvLists.delegate = self
        self.tvLists.dataSource = self
        self.tvLists.bounces = false
        //cell type이 두가지이다. 하나는 horizontal로 움직이는 collectionview를 contain하고있는 cell, 다른 하나는 company들의 정보를 보여주는 cell.
        let cellHorizonNib = UINib(nibName: "HorizontalTableViewCell", bundle: nil)
        self.tvLists.register(cellHorizonNib, forCellReuseIdentifier: "HorizontalTableViewCell")
        let cellResultNib = UINib(nibName: "ResultTableViewCell", bundle: nil)
        self.tvLists.register(cellResultNib, forCellReuseIdentifier: "ResultTableViewCell")
        
        
    }
    
    //horizontal, 기본 list들을 모두 갖고와서 보여주기위한 데이터를 load하는 부분.
    public func dataInit() {
        self.nonHorizontalResult = []
        self.horizontalResult = []
        APIRequest.shared.requestSearchLists { (result) in
            if let _result = result {
                self.defaultDataResponse = _result
                self.nonHorizontalResult = _result.items.compactMap({ (element) -> searchItem? in
                    guard let _type = element.cell_type, _type == .company || _type == .review else {
                        return nil
                    }
                    return element
                })
                self.horizontalResult = _result.items.compactMap({ (element) -> searchItem? in
                    guard let _type = element.cell_type, _type == .horizontal else {
                        return nil
                    }
                    return element
                })
            }else{
                self.defaultDataResponse = .init()
            }
            
            self.reloadDefaultLists()
        } errorHandler: { (error) in
            // error
        }
        
    }
    
    //default list를 reload하는 function. 이전에 dataInit을 호출해야만 한다.
    private func reloadDefaultLists() {
        self.tvLists.reloadData()
    }
}



extension RootViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //result를 업데이트 하는 delegate
        NSLog("Check controller \(searchController)")
    }
}



