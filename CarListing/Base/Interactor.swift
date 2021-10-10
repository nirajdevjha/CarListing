//
//  Interactor.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import Foundation

protocol InteractorType {
    var reachability: ReachabilityType { get }
    func isConnectToInternet() -> Bool
}

extension InteractorType {
    func isConnectToInternet() -> Bool {
        return reachability.isConnectedToNetwork()
    }
}
