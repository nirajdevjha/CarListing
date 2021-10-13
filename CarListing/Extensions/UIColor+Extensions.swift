//
//  UIColor+Extensions.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

extension UIColor {
    static func getRgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: (red/255.0), green: (green/255.0), blue: (blue/255.0), alpha: alpha)
    }
    
    static let appColor: UIColor = UIColor.getRgb(red: 19, green: 19, blue: 19, alpha: 1.0)
    static let darkGrayTxtColor = UIColor.getRgb(red: 74, green: 74, blue: 74, alpha: 1.0)
    static let separatorColor = UIColor.getRgb(red: 224, green: 224, blue: 224, alpha: 1.0)
    static let errorBannerBgColor =  UIColor.getRgb(red: 255, green: 127, blue: 127)
    static let selectedMarkerColor = UIColor.getRgb(red: 252, green: 71, blue: 7)
}
