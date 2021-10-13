//
//  MockReachability.swift
//  CarListingTests
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import XCTest
@testable import CarListing

class MockReachability: ReachabilityType {
    func isConnectedToNetwork() -> Bool {
        return true
    }
}
