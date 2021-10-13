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

    func addShadow(
        opacity: Float = 0.2,
        offset: CGSize = CGSize(width: 0, height: 1)
    ) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 2.0
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
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
