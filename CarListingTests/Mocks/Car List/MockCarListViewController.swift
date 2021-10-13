//
//  MockCarListViewController.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class MockCarListViewController: UIViewController, CarListViewProtocol {
    var isReloadTable = MockModel()
    func reloadTableView() {
        isReloadTable.timesCalled += 1
    }
}

