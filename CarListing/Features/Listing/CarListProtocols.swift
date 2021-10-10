//
//  CarListProtocols.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

protocol CarListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol CarListViewProtocol where Self: UIViewController {
    func reloadTableView()
}

protocol CarListInteractorProtocol: AnyObject { }

protocol CarListWireframeProtocol: WireframeType { }
