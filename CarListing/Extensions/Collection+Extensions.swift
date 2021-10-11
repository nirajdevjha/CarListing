//
//  Collection+Extensions.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
