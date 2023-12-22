//
//  UIView.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

