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
            guard let _ = indexNum else {
                return
            }
            //Horizontal일 경우 보여주기 위한 action임.
            //Horizontal데이터들에 별 데이터가 없어서 일단 구현하지 않았음.
        }else{
            guard let vc = UIStoryboard(name: "DetailViewControllers", bundle: nil).instantiateViewController(withIdentifier: "CompanyDetailViewController") as? CompanyDetailViewController else {
                return
            }
            vc.selectedData = data
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
