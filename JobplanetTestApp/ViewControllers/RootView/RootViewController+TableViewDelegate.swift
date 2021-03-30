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
        if self.searchBarController.isActive {
            self.viewModel.cellHeight = .init(repeating: UITableView.automaticDimension, count: self.viewModel.searchFilterCompany.count)
            return self.viewModel.searchFilterCompany.count
        }else{
            self.viewModel.cellHeight = .init(repeating: UITableView.automaticDimension, count: self.viewModel.defaultDataResponse.items.count)
            return self.viewModel.defaultDataResponse.items.count
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var data : searchItem
        if self.searchBarController.isActive {
            if self.viewModel.searchFilterCompany.count <= indexPath.row {
                return
            }
            data = self.viewModel.searchFilterCompany[indexPath.row]
        }else{
            data = self.viewModel.defaultDataResponse.items[indexPath.row]
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell, let type = data.cell_type {
            switch type {
            case .horizontal :
                self.viewModel.cellHeight[indexPath.row] = cell.cvHorizontal.collectionViewLayout.collectionViewContentSize.height
                break
            default:
                self.viewModel.cellHeight[indexPath.row] = cell.frame.height
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
            guard self.viewModel.searchFilterCompany.count > indexPath.row else {
                return ResultTableViewCell()
            }
            selectData = self.viewModel.searchFilterCompany[indexPath.row]
        }else{
            guard self.viewModel.defaultDataResponse.items.count > indexPath.row else {
                return ResultTableViewCell()
            }
            selectData = self.viewModel.defaultDataResponse.items[indexPath.row]
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
                cell.layoutIfNeeded()
                break
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        var selectData : searchItem
        if self.searchBarController.isActive {
            guard self.viewModel.searchFilterCompany.count > indexPath.row else {
                return .leastNonzeroMagnitude
            }
            selectData = self.viewModel.searchFilterCompany[indexPath.row]
        }else{
            guard self.viewModel.defaultDataResponse.items.count > indexPath.row else {
                return .leastNonzeroMagnitude
            }
            selectData = self.viewModel.defaultDataResponse.items[indexPath.row]
        }
        guard let type = selectData.cell_type, type == .horizontal else {
            return .leastNonzeroMagnitude
        }
        
        return 100
    }
}
