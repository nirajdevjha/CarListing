//
//  MapListPresenter.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit
import MapKit

class MapListPresenter {

    private let interactor: MapListInteractorProtocol
    private let wireframe: MapListWireframeProtocol
    private weak var view: MapListViewProtocol?
    private var carList: CarList = []

    private enum Constants {
        static let errorMessage = "Unable to fetch the cars"
        static let noInternetMessage = "You seem to be offline"
    }

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
        guard let view = view else { return }
        if !interactor.isConnectToInternet() {
            let bannerData = CarListingBannerViewModel(message: Constants.noInternetMessage, bgColor: UIColor.errorBannerBgColor)
            view.showListingFloatingButton(isHidden: true)
            self.wireframe.showBannerView(from: view, bannerData: bannerData)
            return
        }

        interactor.fetchCarList { [weak self] carList in
            guard let self = self else { return }
            self.carList = carList
            self.createMapMarkers()
        } failure: { [weak self] error in
            guard let self = self else { return }
            let bannerData = CarListingBannerViewModel(message: Constants.errorMessage, bgColor: UIColor.errorBannerBgColor)
            self.wireframe.showBannerView(from: view, bannerData: bannerData)
        }
    }

    func createMapMarkers() {
        var carAnnotations: [CarAnnotaion] = []
        for car in carList {
            let carAnnotation = CarAnnotaion(id: car.id, title: car.name, coordinate: CLLocationCoordinate2D(latitude: car.latitude, longitude: car.longitude))
            carAnnotations.append(carAnnotation)
        }
        view?.markCarsOnMap(carLocations: carAnnotations)
    }
}

extension MapListPresenter: MapListPresenterProtocol {
    func viewDidLoad() {
        view?.setInitialLocationOnMap(
            initialLocation: CLLocation(latitude: 48.137154, longitude: 11.576124),
            regionRadius: 4000
        )
        fetchCarList()
    }

    func openCarListing() {
        guard let sourceView = view else { return }
        wireframe.router.present(module: Module.carList(carList: carList), sourceView: sourceView, in: nil, animated: true)
    }

    func getSelectedCarData(carAnnotation: CarAnnotaion) -> SelectedCarViewData? {

        let selectedCar = carList.first { car in
            car.id == carAnnotation.id
        }
        if let selectedCar = selectedCar {
            let fuelText = "\((selectedCar.fuelLevel * 100).cleanValue) %"
            let carInfoList: [CarInfoViewData] = [
                CarInfoViewModel(icon: .fuel, title: fuelText),
                CarInfoViewModel(icon: .color, title: selectedCar.color.replacingOccurrences(of: "_", with: " ", options: .literal, range: nil).capitalized),
                CarInfoViewModel(icon: .cleanliness, title: selectedCar.innerCleanliness.cleanlinessText)
            ]

            let selectedCarData = SelectedCarViewModel(nameMake: "\(selectedCar.name) from \(selectedCar.make)", license: selectedCar.licensePlate, carImageUrl: selectedCar.carImageUrl, infoList: carInfoList)
            return selectedCarData
        }
        return nil
    }
}

extension MapListPresenter: MapListInteractorOutputProtocol {
    
}


