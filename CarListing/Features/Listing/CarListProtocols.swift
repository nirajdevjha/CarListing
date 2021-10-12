//
//  CarListProtocols.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

protocol CarListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func getCellViewModel(for index: Int) -> CarInfoCellVMRepresentable?
    func numberOfRows(in section: Int) -> Int
    func dismissCarListVC()
}

protocol CarListViewProtocol where Self: UIViewController {
    func reloadTableView()
}

protocol CarListInteractorProtocol: AnyObject {
   func getCarList() -> CarList
}

protocol CarListWireframeProtocol: WireframeType { }
