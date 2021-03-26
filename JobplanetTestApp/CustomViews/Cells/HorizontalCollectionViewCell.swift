//
//  HorizontalCollectionViewCell.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import UIKit
import Kingfisher

class HorizontalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imvThumb: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data : searchItem) {
        
    }
}
