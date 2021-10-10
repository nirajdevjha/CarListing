//
//  UIColor+Extensions.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

extension UIColor {
    static func getRgb(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: (red/255.0), green: (green/255.0), blue: (blue/255.0), alpha: alpha)
    }

    static var appColor: UIColor {
       return UIColor.getRgb(19, green: 19, blue: 19, alpha: 1.0)
     }
}
