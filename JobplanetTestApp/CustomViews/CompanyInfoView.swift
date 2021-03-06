//
//  CompanyInfoView.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation
import UIKit

class CompanyInfoView: UIView {
    @IBOutlet var container: UIView!
    
    @IBOutlet weak var lbInfoSummary: UILabel!
    
    @IBOutlet weak var lbSalaryAvg: UILabel!
    @IBOutlet weak var lbSalaryAvgNum: UILabel!
    
    @IBOutlet weak var lbInterview: UILabel!
    @IBOutlet weak var lbInterviewDescription: UILabel!
    
    @IBOutlet weak var uivBorder: UIView!
    
    @IBOutlet weak var uivSeeMore: UIView!
    @IBOutlet weak var btnSeeMore: UIButton!
    
    private var act : (()->Void)? = nil
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Drawing code
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    deinit {
        NSLog("Company Info View deinit")
    }
    
    private func commonInit() {
        guard let views = Bundle.main.loadNibNamed("CompanyInfoView", owner: self, options: nil), let view = views.first as? UIView else {return}
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        NSLog("CompanyInfoView Datas :: \(self.bounds) || \(self.frame)")
        self.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.lbInfoSummary.numberOfLines = 0
        self.lbInfoSummary.font = .systemFont(ofSize: 22, weight: .bold)
        self.lbInfoSummary.textColor = Constants.Colors.mainTextColor
        
        self.lbSalaryAvg.text = "????????????".localized
        self.lbSalaryAvg.textColor = Constants.Colors.salaryColor
        self.lbSalaryAvg.font = .systemFont(ofSize: 15, weight: .regular)
        
        self.lbInterview.text = "????????????".localized
        self.lbInterview.font = .systemFont(ofSize: 15, weight: .regular)
        self.lbInterview.textColor = Constants.Colors.mainTextColor
        
        self.lbInterviewDescription.numberOfLines = 0
        self.lbInterviewDescription.textColor = Constants.Colors.descriptionColor
        self.lbInterviewDescription.font = .systemFont(ofSize: 15, weight: .regular)
        
        self.uivBorder.backgroundColor = .gray
        
        self.btnSeeMore.tintColor = Constants.Colors.btnSeeMoreColor
        self.btnSeeMore.setTitle("???????????? ?????????", for: .normal)
        self.btnSeeMore.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        self.btnSeeMore.addTarget(self, action: #selector(self.seeMoreAct(_:)), for: .touchUpInside)
    }
    
    public func setInfoData(data : searchItem, act: (()->Void)? = nil) {
        if let _act = act {
            self.act = _act
            self.uivSeeMore.isHidden = false
        }else{
            self.uivSeeMore.isHidden = true
        }
        self.lbInfoSummary.text = data.review_summary
        let defaultText = "\(data.salary_avg) ??????"
        let attrText = NSMutableAttributedString(string: defaultText, attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .regular), .foregroundColor : Constants.Colors.mainTextColor])
        let range = (defaultText as NSString).range(of: "\(data.salary_avg)")
        attrText.addAttributes([.font: UIFont.systemFont(ofSize: 20, weight: .bold), .foregroundColor: Constants.Colors.mainTextColor], range: range)
        self.lbSalaryAvgNum.attributedText = attrText
        
        self.lbInterviewDescription.text = data.interview_question
    }
    
    @objc private func seeMoreAct(_ sender: UIButton) {
        self.act?()
    }
}
