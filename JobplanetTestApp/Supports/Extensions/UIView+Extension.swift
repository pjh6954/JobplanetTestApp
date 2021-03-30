//
//  UIView+Extension.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation
import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.parentViewController
        } else {
            return nil
        }
    }
}

