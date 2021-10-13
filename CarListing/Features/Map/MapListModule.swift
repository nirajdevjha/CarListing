//
//  MapListModule.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

final class MapListModule: ModuleLaunchable {
    let viewController: UIViewController
    let wireframe: WireframeType

    init(depedencies: Dependencies, router: RouterType) throws {

        let controller = MapListViewController()

        let networkManager = NetworkManager()
        let service = CarService(networkManager: networkManager)

        let interactor: MapListInteractorProtocol = MapListInteractor(
            reachability: depedencies.reachability,
            service: service
        )
        let wireframe: MapListWireframeProtocol = MapListWireframe(router: router)
        let presenter: MapListPresenterProtocol & MapListInteractorOutputProtocol = MapListPresenter(
            interactor: interactor,
            view: controller,
            wireframe: wireframe
        )
        interactor.presenter = presenter
        viewController = controller
        controller.presenter = presenter
        self.wireframe = wireframe
    }
}

