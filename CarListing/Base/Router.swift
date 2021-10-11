//
//  Router.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//


import UIKit

protocol RouterType {
    func setRootViewController(module: Module, window: UIWindow)
    func push(module: Module, in navigationController: UINavigationController, animated: Bool)
    func present(module: Module, in navigationController: UINavigationController, animated: Bool)
}

final class Router: RouterType {
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func launchable(for module: Module) -> ModuleLaunchable? {
        switch module {
        case .carMapList:
            return try? MapListModule(depedencies: dependencies, router: self)
        case .carList(let carList):
            return try? CarListModule(depedencies: dependencies, router: self, carList: carList)
        }
    }

    func setRootViewController(
        module: Module,
        window: UIWindow
    ) {
        guard let launchable = launchable(for: module) else {
            return
        }
        launchable.wireframe.setRootViewController(launchable.viewController, on: window)
    }

    func push(module: Module, in navigationController: UINavigationController, animated: Bool) {
        guard let launchable = launchable(for: module) else {
            return
        }
        launchable.wireframe.push(launchable.viewController, on: navigationController, animated: animated)
    }

    func present(module: Module, in navigationController: UINavigationController, animated: Bool) {
        guard let launchable = launchable(for: module) else {
            return
        }
        launchable.wireframe.present(launchable.viewController, on: navigationController, animated: animated)
    }
}
