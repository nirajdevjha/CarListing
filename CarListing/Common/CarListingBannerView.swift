//
//  CarListingBannerView.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import UIKit

protocol CarListingBannerViewData {
    var message: String { get }
    var bgColor: UIColor { get }
}

final class CarListingBannerView: BaseView {

    private lazy var containerView: UIView = {
        let view = UIView().disableAutoResize()
        return view
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero).disableAutoResize()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(containerView)
        containerView.addSubview(messageLabel)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
    }

    private func removeFareChangeView() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0.0
        }) { finished in
            if finished {
                self.removeFromSuperview()
            }
        }
    }

    private func show(from bannerData: CarListingBannerViewData) {
        containerView.backgroundColor = bannerData.bgColor
        messageLabel.text = bannerData.message
    }

    class func showBannerView(from parentView: UIView, bannerData: CarListingBannerViewData) {
        DispatchQueue.dispatchToMainThreadIfRequired {
            let bannerView = CarListingBannerView().disableAutoResize()
            bannerView.show(from: bannerData)
            parentView.addSubview(bannerView)

            NSLayoutConstraint.activate([
                bannerView.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
                bannerView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
                bannerView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),

            ])
            bannerView.layoutIfNeeded()

            let actualYorigin = bannerView.frame.origin.y
            bannerView.frame.origin.y = bannerView.frame.minY - 25
            UIView.animate(withDuration: 0.3) {
                bannerView.frame.origin.y = actualYorigin
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                bannerView.removeFareChangeView()
            }
        }
    }
}
