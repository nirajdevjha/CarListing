//
//  CarListPresenter.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

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

    private func initializeCarCellViewModels() {
        carCellViewModels.removeAll()
        let carList = interactor.getCarList()
        for (idx, car) in carList.enumerated() {
            let nameMakeText = "\(car.name) | \(car.make)"
            let fuelText = "Fuel: \((car.fuelLevel * 100).cleanValue) %"
            let carCellViewModel = CarInfoCellViewModel(rowType: .info, carImage: car.carImageUrl, nameMake: nameMakeText, licensePlate: car.licensePlate, fuelText: fuelText)
            carCellViewModels.append(carCellViewModel)
            if idx != carList.count - 1 {
                let separatorCellModel = SeparatorCellViewModel(rowType: .separator, separatorColor: UIColor.separatorColor)
                carCellViewModels.append(separatorCellModel)
            }
        }
    }
}

extension CarListPresenter: CarListPresenterProtocol {
    func viewDidLoad() {
        initializeCarCellViewModels()
        view?.reloadTableView()
    }

    func getCellViewModel(for index: Int) -> CarInfoCellVMRepresentable? {
        let cellVM = carCellViewModels[safe: index]
        return cellVM
    }

    func numberOfRows(in section: Int) -> Int {
       return carCellViewModels.count
    }

    func dismissCarListVC() {
        guard let view = view else {
            return
        }
        wireframe.dismiss(viewController: view, animated: true)
    }
}
