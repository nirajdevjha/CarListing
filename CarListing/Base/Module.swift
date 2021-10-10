//
//  Module.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

protocol ModuleLaunchable {
    var viewController: UIViewController { get }
    var wireframe: WireframeType { get }
}

enum Module {
    case carMapList
    case carList(carList: CarList)
}
