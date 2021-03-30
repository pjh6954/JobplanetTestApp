//
//  Constants.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/25.
//

import Foundation
import UIKit

struct Constants {
    struct Colors {
        
        static let mainTextColor : UIColor = {
            if #available(iOS 13, *) {
                return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                    if UITraitCollection.userInterfaceStyle == .dark {
                        return UIColor.white
                    }else{
                        return UIColor.black
                    }
                }
            }else{
                return UIColor.black
            }
        }()
        
        static let rateColor : UIColor = .yellow
        
        static let industryColor : UIColor = .gray
        
        static let salaryColor : UIColor = .green
        
        static let descriptionColor : UIColor = .gray
        
        static let btnSeeMoreColor : UIColor = {
            if #available(iOS 13, *) {
                return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                    if UITraitCollection.userInterfaceStyle == .dark {
                        return UIColor.systemGray2
                    }else{
                        return UIColor.systemGray4
                    }
                }
            }else{
                return UIColor.systemGray4
            }
        }()
        
        static let prosColor : UIColor = .blue
        
        static let consColor : UIColor = .red
    }
}
