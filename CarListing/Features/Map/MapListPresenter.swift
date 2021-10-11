//
//  MapListPresenter.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import Foundation

class MapListPresenter {

    private let interactor: MapListInteractorProtocol
    private let wireframe: MapListWireframeProtocol
    private weak var view: MapListViewProtocol?


    init(
        interactor: MapListInteractorProtocol,
        view: MapListViewProtocol,
        wireframe: MapListWireframeProtocol
    ) {
        self.interactor = interactor
        self.view = view
        self.wireframe = wireframe
    }
}

extension MapListPresenter: MapListPresenterProtocol {
    func viewDidLoad() {
    }
}

extension MapListPresenter: MapListInteractorOutputProtocol {
    
}
