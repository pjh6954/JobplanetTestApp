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
        self.lbTitle.textColor = .gray
        self.lbTitle.numberOfLines = 0
        self.lbTitle.adjustsFontSizeToFitWidth = true
        self.lbTitle.minimumScaleFactor = 0.5
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    func setData(data : searchTheme) {
        if let url = URL(string: data.cover_image), let color = UIColor(hex: data.color) {
            self.imvThumb.kf.setImage(with: url, placeholder: UIImage(color: color), options: nil) { (result, error) in
                
            }
        }
        self.lbTitle.text = data.title
        
    }
}
