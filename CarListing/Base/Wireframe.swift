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
        sourceView: UIViewController?,
        viewController: UIViewController,
        on navigationController: UINavigationController?,
        animated: Bool
    )

    func dismiss(viewController: UIViewController, animated: Bool)
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
        sourceView: UIViewController?,
        viewController: UIViewController,
        on navigationController: UINavigationController?,
        animated: Bool = true
    ) {
        if let navigationController = navigationController {
            navigationController.present(viewController, animated: animated)
        } else {
            let navController = UINavigationController(rootViewController: viewController)
            sourceView?.present(navController, animated: animated)
        }
    }

    func dismiss(viewController: UIViewController, animated: Bool) {
        viewController.dismiss(animated: animated)
    }
}
