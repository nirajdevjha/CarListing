//
//  MapListProtocols.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

protocol MapListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol MapListViewProtocol where Self: UIViewController {
}

protocol MapListInteractorProtocol: AnyObject, InteractorType {
    var presenter: MapListInteractorOutputProtocol? { get set }
    func fetchCarList(success: @escaping ((CarList) -> Void), failure: @escaping ((APIError) -> Void))
}

protocol MapListInteractorOutputProtocol: AnyObject {

}

protocol MapListWireframeProtocol: WireframeType {

}
