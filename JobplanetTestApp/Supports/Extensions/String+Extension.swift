//
//  String+Extension.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/30.
//

import Foundation

extension String {
    var localized: String {
        // 타겟 별 로컬라이즈 가능
        // https://stackoverflow.com/a/28432731/12895520
        return NSLocalizedString(self, comment: "")
    }
}
