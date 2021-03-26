//
//  ResultTableViewCell.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var uivCompanyTitle: CompanyTitleView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public func setTitle(data : searchItem) {
        switch data.cell_type {
        case .company:
            self.uivCompanyTitle.setData(data: data)
            break
        case .review:
            self.uivCompanyTitle.setData(data: data)
            break
        default :
            break
        }
        
    }
}
