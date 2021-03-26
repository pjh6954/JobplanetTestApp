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
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.horizontalResult.isEmpty ? 0 : 1
        }else{
            return self.nonHorizontalResult.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalTableViewCell", for: indexPath) as? HorizontalTableViewCell else {
                return HorizontalTableViewCell(frame: .zero)
            }
            cell.setData(cvDelegate: self, cvDataSource: self)
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell, let _type = self.nonHorizontalResult[indexPath.row].cell_type else {
                return ResultTableViewCell(frame: .zero)
            }
            cell.setTitle(data: self.nonHorizontalResult[indexPath.row])
            //cell.setDatas(type: _type, data: self.nonHorizontalResult[indexPath.row])
            return cell
        }
    }
}
