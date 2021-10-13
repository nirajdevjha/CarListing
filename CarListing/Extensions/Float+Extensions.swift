//
//  Float+Extensions.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import Foundation

extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
