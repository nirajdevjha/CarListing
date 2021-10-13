//
//  MapListProtocols.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit
import MapKit

protocol MapListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func openCarListing()
    func getSelectedCarData(carAnnotation: CarAnnotaion) -> SelectedCarViewData?
}

protocol MapListViewProtocol where Self: UIViewController {
    func setInitialLocationOnMap(initialLocation: CLLocation, regionRadius: CLLocationDistance)
    func markCarsOnMap(carLocations: [CarAnnotaion])
    func showListingFloatingButton(isHidden: Bool)
}

protocol MapListInteractorProtocol: AnyObject, InteractorType {
    var presenter: MapListInteractorOutputProtocol? { get set }
    func fetchCarList(success: @escaping ((CarList) -> Void), failure: @escaping ((APIError) -> Void))
}

protocol MapListInteractorOutputProtocol: AnyObject { }

protocol MapListWireframeProtocol: WireframeType {
    func showBannerView(from parentView: UIViewController, bannerData: CarListingBannerViewData)
}
