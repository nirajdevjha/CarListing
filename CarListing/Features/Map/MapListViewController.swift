//
//  MapListViewController.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

class MapListViewController: UIViewController {
    var presenter: MapListPresenterProtocol?

    private let listingFloatingButton: UIButton = {
        let button = UIButton().disableAutoResize()
        button.addTarget(self, action: #selector(didTapListingFloatingButton), for: .touchUpInside)
        button.setTitle("List", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        view.addSubview(listingFloatingButton)

        NSLayoutConstraint.activate([
            listingFloatingButton.widthAnchor.constraint(equalToConstant: 50),
            listingFloatingButton.heightAnchor.constraint(equalTo: listingFloatingButton.widthAnchor),
            listingFloatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            listingFloatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    @objc
    private func didTapListingFloatingButton() {
        presenter?.openCarListing()
    }
}

extension MapListViewController: MapListViewProtocol {

}
