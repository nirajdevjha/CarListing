//
//  CarListPresenter.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

class CarListPresenter {

    private let interactor: CarListInteractorProtocol
    private let wireframe: CarListWireframeProtocol
    private weak var view: CarListViewProtocol?

    private var carList: CarList = []

    init(
        interactor: CarListInteractorProtocol,
        view: CarListViewProtocol,
        wireframe: CarListWireframeProtocol
    ) {
        self.interactor = interactor
        self.view = view
        self.wireframe = wireframe
    }
}

extension CarListPresenter: CarListPresenterProtocol {
    func viewDidLoad() {

    }
}
