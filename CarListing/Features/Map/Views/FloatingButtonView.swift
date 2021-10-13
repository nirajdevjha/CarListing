//
//  FloatingButtonView.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import UIKit

typealias VoidBlock = () -> Void

final class FloatingButtonView: BaseView {

    private let listingFloatingButton: UIButton = {
        let button = UIButton().disableAutoResize()
        button.addTarget(self, action: #selector(didTapListingFloatingButton), for: .touchUpInside)
        button.setImage(UIImage(asset: .list), for: .normal)
        return button
    }()

    var onFloatingButtonTap: VoidBlock?

    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(
            listingFloatingButton
        )
        NSLayoutConstraint.activate([
            listingFloatingButton.topAnchor.constraint(equalTo: topAnchor),
            listingFloatingButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            listingFloatingButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            listingFloatingButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    @objc
    private func didTapListingFloatingButton() {
        onFloatingButtonTap?()
    }
}

