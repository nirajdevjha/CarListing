//
//  MapListPresenter.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

class MapListPresenter {

    private let interactor: MapListInteractorProtocol
    private let wireframe: MapListWireframeProtocol
    private weak var view: MapListViewProtocol?
    private var carList: CarList = []

    init(
        interactor: MapListInteractorProtocol,
        view: MapListViewProtocol,
        wireframe: MapListWireframeProtocol
    ) {
        self.interactor = interactor
        self.view = view
        self.wireframe = wireframe
    }

    private func fetchCarList() {
        interactor.fetchCarList { [weak self] carList in
            guard let self = self else { return }
            self.carList = carList
        } failure: { [weak self] error in
            //TODO: handle error
        }
    }
}

extension MapListPresenter: MapListPresenterProtocol {
    func viewDidLoad() {
        fetchCarList()
    }

    func openCarListing() {
        guard let sourceView = view else { return }
        wireframe.router.present(module: Module.carList(carList: carList), sourceView: sourceView, in: nil, animated: true)
    }
}

extension MapListPresenter: MapListInteractorOutputProtocol {
    
}
