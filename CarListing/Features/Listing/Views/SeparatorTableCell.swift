//
//  SeparatorTableCell.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

final class SeparatorTableCell: BaseTableCell {
    private let separatorView: UIView = {
        let view = UIView(frame: .zero).disableAutoResize()
        view.backgroundColor = UIColor.separatorColor
        return view
    }()

    static var reuseIdentifier: String {
        return String(describing: self)
    }

    override func setupViews() {
        super.setupViews()
        selectionStyle = .none

        contentView.addSubview(separatorView)

        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension SeparatorTableCell {
    func configure(from model: SeparatorCellViewModel) {
        separatorView.backgroundColor = model.separatorColor
    }
}
