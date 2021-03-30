//
//  RootViewController+TableViewDelegate.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import Foundation
import UIKit

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        if section == 0 {
            return self.horizontalResult.isEmpty ? 0 : 1
        }else{
            return self.nonHorizontalResult.count
        }
        */
        if self.searchBarController.isActive {
            self.cellHeights = .init(repeating: UITableView.automaticDimension, count: self.searchFilterCompany.count)
            return self.searchFilterCompany.count
        }else{
            self.cellHeights = .init(repeating: UITableView.automaticDimension, count: self.defaultDataResponse.items.count)
            return self.defaultDataResponse.items.count
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var data : searchItem
        if self.searchBarController.isActive {
            if self.searchFilterCompany.count <= indexPath.row {
                return
            }
            data = self.searchFilterCompany[indexPath.row]
        }else{
            data = self.defaultDataResponse.items[indexPath.row]
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell, let type = data.cell_type {
            switch type {
            case .horizontal :
                self.cellHeights[indexPath.row] = cell.cvHorizontal.collectionViewLayout.collectionViewContentSize.height
                break
            default:
                self.cellHeights[indexPath.row] = cell.frame.height
                break
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else {
            return ResultTableViewCell()
        }
        var selectData : searchItem
        if self.searchBarController.isActive {
            guard self.searchFilterCompany.count > indexPath.row else {
                return ResultTableViewCell()
            }
            selectData = self.searchFilterCompany[indexPath.row]
        }else{
            guard self.defaultDataResponse.items.count > indexPath.row else {
                return ResultTableViewCell()
            }
            selectData = self.defaultDataResponse.items[indexPath.row]
        }
        
        if let type = selectData.cell_type {
            switch type {
            case .company, .review :
                cell._delegate = self
                cell.setTitle(data: selectData)
                cell.layoutIfNeeded()
                break
            case .horizontal:
                cell.setTitle(data: selectData, cvDelegate: self, cvDataSource: self, rowIndex: indexPath.row)
                cell.layoutIfNeeded()
                let height : CGFloat = cell.cvHorizontal.collectionViewLayout.collectionViewContentSize.height
                cell.constraintHeightCV.constant = height
                break
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.cellHeights.count > indexPath.row {
            print("HERE TABLE HEIGHT : \(self.cellHeights[indexPath.row])")
            return self.cellHeights[indexPath.row]
        }else{
            return UITableView.automaticDimension
        }
    }
}
