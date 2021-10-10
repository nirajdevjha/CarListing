//
//  CarListModule.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

final class CarListModule: ModuleLaunchable {
    let viewController: UIViewController
    let wireframe: WireframeType

    init(
        depedencies: Dependencies,
        router: RouterType,
        carList: CarList) throws {

        let controller = CarListView()

        let interactor: CarListInteractorProtocol = CarListInteractor()
        let wireframe: CarListWireframeProtocol = CarListWireframe(
            router: router
        )

        let presenter: CarListPresenterProtocol = CarListPresenter(
            interactor: interactor,
            view: controller,
            wireframe: wireframe
        )
        viewController = controller
        controller.presenter = presenter
        self.wireframe = wireframe
    }
}

