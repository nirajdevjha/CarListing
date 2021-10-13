//
//  SelectedCarView.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 12/10/21.
//

import UIKit
import SDWebImage

protocol SelectedCarViewDelegate: AnyObject {
    func selectedCarViewDismissed()
}

protocol SelectedCarViewData {
    var nameMake: String { get }
    var license: String { get }
    var carImageUrl: String? { get }
    var infoList: [CarInfoViewData] { get }
}

final class SelectedCarView: BaseView {

    private let closeButton: UIButton = {
        let button = UIButton().disableAutoResize()
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        button.setImage(UIImage(asset: .circledClose), for: .normal)
        return button
    }()

    private let carImageView: UIImageView = {
        let imageView = UIImageView().disableAutoResize()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero).disableAutoResize()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 4
        return stackView
    }()

    private let nameMakeLabel: UILabel = {
        let label = UILabel(frame: .zero).disableAutoResize()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGrayTxtColor
        return label
    }()

    private let licensePlateLabel: UILabel = {
        let label = UILabel(frame: .zero).disableAutoResize()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGrayTxtColor
        return label
    }()

    private let carInfoStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero).disableAutoResize()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 4
        return stackView
    }()

    private let carInfoView: CarInfoView = {
        let view = CarInfoView(frame: .zero).disableAutoResize()
        return view
    }()

    private weak var delegate: SelectedCarViewDelegate?

    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        tag = 999
        addShadow()
        cornerRadius = 10
        
        addSubviews(
            contentStackView,
            carImageView,
            closeButton,
            carInfoStackView
        )
        contentStackView.addArrangedSubviews(
            nameMakeLabel,
            licensePlateLabel
        )

        NSLayoutConstraint.activate([
            carImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            carImageView.heightAnchor.constraint(equalToConstant: 60),
            carImageView.widthAnchor.constraint(equalTo: carImageView.heightAnchor, multiplier: 1.2),
            carImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),

            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10),

            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor),

            carInfoStackView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 16),
            carInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            carInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            carInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

    @objc
    private func didTapCloseButton() {
        removeFromSuperview()
        delegate?.selectedCarViewDismissed()
    }

    func configureView(delegate: SelectedCarViewDelegate?, model: SelectedCarViewData) {
        self.delegate = delegate
        nameMakeLabel.text = model.nameMake
        licensePlateLabel.text = model.license

        if let carImageUrlString = model.carImageUrl,
           let carImageUrl = URL(string: carImageUrlString) {
            carImageView.sd_setImage(with: carImageUrl,
                                     placeholderImage: UIImage(asset: .carFallbackImage),
                                     options: .retryFailed)
        } else {
            carImageView.image = UIImage(asset: .carFallbackImage)
        }
        for carInfo in model.infoList {
            let view = CarInfoView(frame: .zero).disableAutoResize()
            carInfoStackView.addArrangedSubview(view)
            view.configureView(model: carInfo)
        }
    }
}
