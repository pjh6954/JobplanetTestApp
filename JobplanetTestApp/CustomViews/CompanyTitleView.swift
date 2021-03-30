//
//  CompanyTitleView.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import UIKit

class CompanyTitleView: UIView {

    @IBOutlet var container: UIView!
    
    @IBOutlet weak var imvThumb: UIImageView!
    @IBOutlet weak var lbCompanyName: UILabel!
    @IBOutlet weak var uivRateContainer: UIView!
    @IBOutlet weak var imvStar: UIImageView!
    @IBOutlet weak var lbRate: UILabel!
    @IBOutlet weak var lbCompanyIndustry: UILabel!
    
    
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
        NSLog("Company Title View deinit")
    }
    
    private func commonInit() {
        guard let views = Bundle.main.loadNibNamed("CompanyTitleView", owner: self, options: nil), let view = views.first as? UIView else {return}
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        NSLog("CommunityMainHomeTopView Datas :: \(self.bounds) || \(self.frame)")
        self.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.imvThumb.image = nil
        
        self.lbCompanyName.text = ""
        self.lbCompanyName.font = .systemFont(ofSize: 20, weight: .bold)
        self.lbCompanyName.textColor = .gray
        
        self.lbRate.text = ""
        self.lbRate.font = .systemFont(ofSize: 17, weight: .regular)
        self.lbRate.textColor = .yellow
        
        self.lbCompanyIndustry.text = ""
        self.lbCompanyIndustry.font = .systemFont(ofSize: 17, weight: .regular)
        self.lbCompanyIndustry.textColor = .gray
        
        self.uivRateContainer.layer.masksToBounds = false
        self.uivRateContainer.layer.borderWidth = 1
        self.uivRateContainer.layer.borderColor = UIColor.gray.cgColor
        self.uivRateContainer.layer.cornerRadius = self.uivRateContainer.frame.height / 2
    }
    
    public func setData(data : searchItem) {
        self.lbCompanyName.text = data.name
        self.imvThumb.kf.setImage(with: URL(string: data.logo_path), placeholder: nil, options: nil) { (result, error) in
            NSLog("result : \(result)")
        }
        self.lbRate.text = "\(data.rate_total_avg)"
        self.lbCompanyIndustry.text = data.industry_name
    }
}
