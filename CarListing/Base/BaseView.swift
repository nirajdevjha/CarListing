//
//  BaseView.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 12/10/21.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    func setupViews() {} // Need override
}
