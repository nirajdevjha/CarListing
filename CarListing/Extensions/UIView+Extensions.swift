//
//  UIView+Extensions.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

extension UIView {
    func disableAutoResize() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }

    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set(newRadius) {
            self.layer.cornerRadius = newRadius
            self.layer.masksToBounds = newRadius > 0
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }

    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
