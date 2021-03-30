//
//  ResultTableViewCell.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cvHorizontal: UICollectionView!
    
    
    @IBOutlet weak var stvNonHorizontalContainer: UIStackView!
    @IBOutlet weak var constraintHeightCV: NSLayoutConstraint!
    @IBOutlet weak var uivCompanyTitle: CompanyTitleView!
    @IBOutlet weak var uivBorder: UIView!
    @IBOutlet weak var uivBottomViewContainer: UIView!
    
    @IBOutlet weak var uivBottomBorder: UIView!
    public var _delegate: rootViewDelegate? = nil
    
    private var initData: searchItem? = nil
    
    private var addSubViews: UIView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let cellNib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        self.cvHorizontal.register(cellNib, forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
        
        self.cvHorizontal.showsHorizontalScrollIndicator = false
        self.cvHorizontal.showsVerticalScrollIndicator = false
        
        self.uivBottomBorder.backgroundColor = .gray
        
        self.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self._delegate = nil
        self.initData = nil
        
        self.cvHorizontal.tag = -1
        self.cvHorizontal.delegate = nil
        self.cvHorizontal.dataSource = nil
        self.cvHorizontal.isHidden = true
        self.constraintHeightCV.constant = 0
        
        self.stvNonHorizontalContainer.isHidden = true
        
        self.addSubViews?.removeFromSuperview()
    }
    
    private func updateRowHeight() {
        DispatchQueue.main.async {
            self.tableView?.updateRowHeightsWithoutReloadingRows()
        }
    }
    
    //MARK: Init Data
    /**
     - Parameters:
        - data: searchItem Model
        - cvDelegate : (Optional) UICollectionViewDelegate
        - cvDataSource : (Optional)UICollectionViewDataSource
        - rowIndex : (Optional)Int
     */
    public func setTitle(data : searchItem, cvDelegate : UICollectionViewDelegate? = nil, cvDataSource: UICollectionViewDataSource? = nil, rowIndex: Int? = nil) {
        switch data.cell_type {
        case .company:
            self.stvNonHorizontalContainer.isHidden = false
            self.cvHorizontal.isHidden = true
            self.initData = data
            self.uivCompanyTitle.setData(data: data)
            let infoView = CompanyInfoView(frame: .zero)
            infoView.translatesAutoresizingMaskIntoConstraints = false
            self.uivBottomViewContainer.addSubview(infoView)
            NSLayoutConstraint.activate([
                .init(item: infoView, attribute: .leading, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .leading, multiplier: 1, constant: 0),
                .init(item: infoView, attribute: .top, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .top, multiplier: 1, constant: 0),
                .init(item: infoView, attribute: .trailing, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .trailing, multiplier: 1, constant: 0),
                .init(item: infoView, attribute: .bottom, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .bottom, multiplier: 1, constant: 0)
            ])
            infoView.setInfoData(data: data, act : self.seeMoreAction)
            
            self.addSubViews = infoView
            break
        case .review:
            NSLog("Check review data : \(data)")
            self.stvNonHorizontalContainer.isHidden = false
            self.cvHorizontal.isHidden = true
            self.initData = data
            self.uivCompanyTitle.setData(data: data)
            let reviewView = CompanyReviewView(frame: .zero)
            reviewView.translatesAutoresizingMaskIntoConstraints = false
            self.uivBottomViewContainer.addSubview(reviewView)
            NSLayoutConstraint.activate([
                .init(item: reviewView, attribute: .leading, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .leading, multiplier: 1, constant: 0),
                .init(item: reviewView, attribute: .top, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .top, multiplier: 1, constant: 0),
                .init(item: reviewView, attribute: .trailing, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .trailing, multiplier: 1, constant: 0),
                .init(item: reviewView, attribute: .bottom, relatedBy: .equal, toItem: self.uivBottomViewContainer, attribute: .bottom, multiplier: 1, constant: 0)
            ])
            reviewView.setReviewData(data: data, act : self.seeMoreAction)
            self.addSubViews = reviewView
            break
        case .horizontal:
            //CollectionView에서 가로로 나와야하는 셀이 세로로 정렬되는 문제가 하나 발생. 방법 고민 중.
            self.stvNonHorizontalContainer.isHidden = true
            guard let rowIndex = rowIndex, let _cvDelegate = cvDelegate, let _cvDataSource = cvDataSource else {
                self.cvHorizontal.isHidden = true
                return
            }
            
            self.cvHorizontal.isHidden = false
            self.cvHorizontal.tag = rowIndex
            self.cvHorizontal.delegate = _cvDelegate
            self.cvHorizontal.dataSource = _cvDataSource
            
            self.cvHorizontal.reloadData()
            break
        default :
            break
        }
    }
    private func seeMoreAction() -> Void {
        guard let _data = self.initData else {
            return
        }
        self._delegate?.selectNonHorizontal(data: _data)
    }
}
