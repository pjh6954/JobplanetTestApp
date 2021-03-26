//
//  HorizontalTableViewCell.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import UIKit

class HorizontalTableViewCell: UITableViewCell {

    @IBOutlet weak var cvHorizontal: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let cellNib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        self.cvHorizontal.register(cellNib, forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(cvDelegate : UICollectionViewDelegate, cvDataSource : UICollectionViewDataSource) {
        self.cvHorizontal.delegate = cvDelegate
        self.cvHorizontal.dataSource = cvDataSource
        self.cvHorizontal.reloadData()
    }
}
