//
//  CompanyReviewView.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import UIKit

class CompanyReviewView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet var container: UIView!
    
    @IBOutlet weak var lbReviewSummary: UILabel!
    
    @IBOutlet weak var lbPros: UILabel!
    @IBOutlet weak var lbProsDescription: UILabel!
    
    @IBOutlet weak var lbCons: UILabel!
    @IBOutlet weak var lbConsDescription: UILabel!
    
    @IBOutlet weak var uivSeeMore: UIView!
    @IBOutlet weak var btnSeeMore: UIButton!
    
    private var act : (()->Void)? = nil
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    deinit {
        NSLog("Company Review Deinit")
    }
    
    private func commonInit() {
        guard let views = Bundle.main.loadNibNamed("CompanyReviewView", owner: self, options: nil), let view = views.first as? UIView else {return}
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        NSLog("CompanyReviewView Datas :: \(self.bounds) || \(self.frame)")
        self.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.lbReviewSummary.numberOfLines = 0
        self.lbReviewSummary.font = .systemFont(ofSize: 22, weight: .bold)
        self.lbReviewSummary.textColor = Constants.Colors.mainTextColor
        
        self.lbPros.text = "장점".localized // LocalizedString 적용을 할 경우 이렇게 사용
        self.lbPros.font = .systemFont(ofSize: 15, weight: .bold)
        self.lbPros.textColor = Constants.Colors.prosColor
        
        self.lbProsDescription.numberOfLines = 0
        
        self.lbCons.text = "단점".localized
        self.lbCons.font = .systemFont(ofSize: 15, weight: .bold)
        self.lbCons.textColor = Constants.Colors.consColor
        
        self.lbConsDescription.numberOfLines = 0
        
        self.btnSeeMore.tintColor = Constants.Colors.btnSeeMoreColor
        self.btnSeeMore.setTitle("기업리뷰 더보기", for: .normal)
        self.btnSeeMore.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        self.btnSeeMore.addTarget(self, action: #selector(self.seeMoreAct(_:)), for: .touchUpInside)
    }
    
    public func setReviewData(data: searchItem, act: (()->Void)? = nil) {
        if let _act = act {
            self.act = _act
            self.uivSeeMore.isHidden = false
        }else{
            self.uivSeeMore.isHidden = true
        }
        self.lbReviewSummary.text = (!data.review_summary.isEmpty ? "\"" + data.review_summary + "\"" : "")
        
        self.lbProsDescription.text = data.pros
        self.lbConsDescription.text = data.cons
        
        
    }
    
    @objc private func seeMoreAct(_ sender: UIButton) {
        self.act?()
    }
}
