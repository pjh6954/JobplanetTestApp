//
//  UITableVIew+Extension.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation
import UIKit

extension UITableView {
    func updateRowHeightsWithoutReloadingRows(animated: Bool = false) {
        let block = {
            self.beginUpdates()
            self.endUpdates()
        }
        
        if animated {
            block()
        }
        else {
            UIView.performWithoutAnimation {
                block()
            }
        }
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return (next as? UITableView) ?? (parentViewController as? UITableViewController)?.tableView
    }
}
