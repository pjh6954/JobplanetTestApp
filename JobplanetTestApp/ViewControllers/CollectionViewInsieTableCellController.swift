//
//  CollectionViewInsieTableCellController.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation
import UIKit

class CollectionViewInsieTableCellController: UICollectionViewController {
    var didLayoutAction: (() -> Void)?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.didLayoutAction?()
        self.didLayoutAction = nil
    }
}
