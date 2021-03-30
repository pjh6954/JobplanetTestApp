//
//  RootViewController+UISearchResultsUpdating.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation
import UIKit

extension RootViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //result를 업데이트 하는 delegate
        NSLog("Check controller \(searchController)")
        guard let text = searchController.searchBar.text else {
            return
        }
        self.filterContentForSearchTex(text)
    }
    
    func searchBarEmpty() -> Bool {
        return searchBarController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchTex(_ searchText: String) {
        self.searchFilterCompany = self.defaultDataResponse.items.filter({ (element) -> Bool in
            element.name.contains(searchText)
        })
        self.tvLists.reloadData()
    }
}
