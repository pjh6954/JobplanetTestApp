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
        //searchController의 searchBar의 text가 변경 될 때마다 호출된다. API통신이 요구될 경우 여기서 해당 method를 호출한다.
        guard let text = searchController.searchBar.text else {
            return
        }
        self.viewModel.filterContentsForSearchText(text)
    }
    
    //현재 쓰이지 않으나, 고도화할 경우 필요할 수 있다고 판단. Extension으로 빼는 것도 고민.
    func searchBarEmpty() -> Bool {
        return searchBarController.searchBar.text?.isEmpty ?? true
    }
}
