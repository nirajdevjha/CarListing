//
//  MapListViewController.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

class MapListViewController: UIViewController {
    var presenter: MapListPresenterProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter?.viewDidLoad()
    }

    private func setupViews() {

    }
}

extension MapListViewController: MapListViewProtocol {

}
