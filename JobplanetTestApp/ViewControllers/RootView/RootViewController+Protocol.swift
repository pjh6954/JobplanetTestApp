//
//  RootViewController+Protocol.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation
import UIKit

protocol rootViewDelegate: class {
    func selectNonHorizontal(data: searchItem, indexNum: Int?)
}

extension rootViewDelegate {
    func selectNonHorizontal(data: searchItem, indexNum: Int? = nil) {
        self.selectNonHorizontal(data: data, indexNum: indexNum)
    }
}

extension RootViewController: rootViewDelegate {
    func selectNonHorizontal(data: searchItem,  indexNum: Int? = nil) {
        if let type = data.cell_type, type == .horizontal {
            guard let _index = indexNum else {
                return
            }
            
        }else{
            guard let vc = UIStoryboard(name: "DetailViewControllers", bundle: nil).instantiateViewController(withIdentifier: "CompanyDetailViewController") as? CompanyDetailViewController else {
                return
            }
            vc.selectedData = data
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
