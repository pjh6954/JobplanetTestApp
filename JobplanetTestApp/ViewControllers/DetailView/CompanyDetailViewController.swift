//
//  CompanyDetailViewController.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation
import UIKit

class CompanyDetailViewController: UIViewController {
    public var selectedData : searchItem? = nil
    private var data : searchItem = .init()
    
    @IBOutlet weak var stvContents: UIStackView!
    
    @IBOutlet weak var imvThumb: UIImageView!
    
    @IBOutlet weak var lbName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInit()
        self.dataInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
        NSLog("\(#fileID) deinit")
    }
    
    private func commonInit() {
        
    }
    
    public func dataInit() {
        guard let _data = self.selectedData, let type = _data.cell_type, type == .company || type == .review else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        self.data = _data
        
        self.navigationItem.title = _data.name
        
        self.imvThumb.kf.setImage(with: URL(string: _data.logo_path))
        self.lbName.text = _data.name
        
        if type == .review {
            let companyView = CompanyReviewView(frame: .zero)
            companyView.translatesAutoresizingMaskIntoConstraints = false
            companyView.setReviewData(data: _data)
            self.stvContents.addArrangedSubview(companyView)
        }else{
            let companyView = CompanyInfoView(frame: .zero)
            companyView.translatesAutoresizingMaskIntoConstraints = false
            companyView.setInfoData(data: _data)
            self.stvContents.addArrangedSubview(companyView)
        }
        
        self.viewInit()
        
    }
    
    //????????? ???????????? ?????? ???????????? ??????. ??????????????? ??????????????? ???????????? ????????????.
    //TODO: ????????? ?????? ?????? ???????????? ???????????? ??????
    private func viewInit() {
        /*
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            .init(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            .init(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
            .init(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0),
            .init(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
            .init(item: scrollView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0)
        ])
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            .init(item: stackView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 0),
            .init(item: stackView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 0),
            .init(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: scrollView, attribute: .trailing, multiplier: 1, constant: 0),
            .init(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        let url = URL(string: self.data.logo_path)
        imageView.kf.setImage(with: url)
        */
    }
}
