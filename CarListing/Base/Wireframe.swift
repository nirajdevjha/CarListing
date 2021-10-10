//
//  Wireframe.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

protocol WireframeType {

    var router: RouterType { get }

    func setRootViewController(
        _ viewController: UIViewController,
        on window: UIWindow
    )

    func push(
        _ viewController: UIViewController,
        on navigationController: UINavigationController,
        animated: Bool
    )

    func present(
        _ viewController: UIViewController,
        on navigationController: UINavigationController,
        animated: Bool
    )
}

extension WireframeType {

    func setRootViewController(
        _ viewController: UIViewController,
        on window: UIWindow
    ) {
        window.rootViewController = viewController
    }

    func push(
        _ viewController: UIViewController,
        on navigationController: UINavigationController,
        animated: Bool = true
    ) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    func present(
        _ viewController: UIViewController,
        on navigationController: UINavigationController,
        animated: Bool = true
    ) {
        navigationController.present(viewController, animated: animated)
    }

}
