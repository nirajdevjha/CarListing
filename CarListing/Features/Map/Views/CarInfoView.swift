//
//  CarInfoView.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 12/10/21.
//

import UIKit

protocol CarInfoViewData {
    var icon: CarListingAssets { get }
    var title: String { get }
}

final class CarInfoView: BaseView {

    private let iconImageView: UIImageView = {
        let imageView = UIImageView().disableAutoResize()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero).disableAutoResize()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero).disableAutoResize()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGrayTxtColor
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubviews(
            stackView
        )
        stackView.addArrangedSubviews(
            iconImageView,
            titleLabel
        )

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
        ])
    }
    
    func configureView(model: CarInfoViewData) {
        iconImageView.image = UIImage(asset: model.icon)
        titleLabel.text = model.title
    }
}
