//
//  CarListTableCell.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit
import SDWebImage

final class CarListTableCell: BaseTableCell {

    private let carImageView: UIImageView = {
        let imageView = UIImageView().disableAutoResize()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let carInfoStackView: UIStackView = {
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

    private let fuelLabel: UILabel = {
        let label = UILabel(frame: .zero).disableAutoResize()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGrayTxtColor
        return label
    }()

    static var reuseIdentifier: String {
        return String(describing: self)
    }

    override func setupViews() {
        super.setupViews()
        selectionStyle = .none

        contentView.addSubviews(
            carImageView,
            carInfoStackView
        )
        carInfoStackView.addArrangedSubviews(
            nameMakeLabel,
            licensePlateLabel,
            fuelLabel
        )

        NSLayoutConstraint.activate([
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            carImageView.heightAnchor.constraint(equalToConstant: 80),
            carImageView.widthAnchor.constraint(equalTo: carImageView.heightAnchor, multiplier: 1.2),
            carImageView.centerYAnchor.constraint(equalTo: carInfoStackView.centerYAnchor),

            carInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            carInfoStackView.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
            carInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            carInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

extension CarListTableCell {
    func configure(from model: CarInfoCellViewModel) {
        nameMakeLabel.text = model.nameMake
        licensePlateLabel.text = model.licensePlate
        fuelLabel.text = model.fuelText
        if let carImageUrlString = model.carImage,
           let carImageUrl = URL(string: carImageUrlString) {
            carImageView.sd_setImage(with: carImageUrl,
                                     placeholderImage: UIImage(asset: .carFallbackImage),
                                     options: .retryFailed)
        } else {
            carImageView.image = UIImage(asset: .carFallbackImage)
        }
    }
}
