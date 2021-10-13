//
//  CarListingAssets.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import UIKit

enum CarListingAssets: String {
    case carFallbackImage = "car_default"
    case circledClose = "circled_close"
    case close
    case cleanliness
    case fuel
    case color
    case list
    case carMarker = "car_marker"
}

extension UIImage {
    convenience init?(asset: CarListingAssets) {
        self.init(
            named: asset.rawValue,
            in: Bundle.main,
            compatibleWith: nil
        )
    }
}
