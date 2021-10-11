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

    private var carCellViewModels: [CarInfoCellVMRepresentable] = []

    init(
        interactor: CarListInteractorProtocol,
        view: CarListViewProtocol,
        wireframe: CarListWireframeProtocol
    ) {
        self.interactor = interactor
        self.view = view
        self.wireframe = wireframe
    }

    private func initializeWeatherDetailsViewModels() {
        carCellViewModels.removeAll()
        let carList = interactor.getCarList()
        for car in carList {
            let nameMakeText = "\(car.name) | \(car.make)"
            let fuelText = "Fuel: \(car.fuelLevel * 100) %"
            let carCellViewModel = CarInfoCellViewModel(rowType: .info, carImage: car.carImageUrl, nameMake: nameMakeText, licensePlate: car.licensePlate, fuelText: fuelText)
            carCellViewModels.append(carCellViewModel)
        }
    }
}

extension CarListPresenter: CarListPresenterProtocol {
    func viewDidLoad() {
        initializeWeatherDetailsViewModels()
        view?.reloadTableView()
    }

    func getCellViewModel(for index: Int) -> CarInfoCellVMRepresentable? {
        let cellVM = carCellViewModels[safe: index]
        return cellVM
    }

    func numberOfRows(in section: Int) -> Int {
       return carCellViewModels.count
    }
}
