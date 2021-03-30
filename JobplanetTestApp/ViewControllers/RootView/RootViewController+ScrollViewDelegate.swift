//
//  RootViewController+ScrollViewDelegate.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import Foundation
import UIKit

//처음 구현시 TableView와 Collection View, ScrollView 혼합해서 사용할 때 쓰인 부분. 현재는 필요없는 상태이나, 개선 방안 구상을 위해 남겨둠.(여러개의 Scrollview 존재시 자연스럽게 이동하도록 하는 방법에 대해서)
extension RootViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
