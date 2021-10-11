//
//  CarCellViewModels.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 11/10/21.
//

import UIKit

protocol CarInfoCellVMRepresentable {
    var rowType: CarInfoRowType { get }
}

enum CarInfoRowType {
    case info
    case separator
}

struct CarInfoCellViewModel: CarInfoCellVMRepresentable {
    let rowType: CarInfoRowType
    let carImage: String?
    let nameMake: String
    let licensePlate: String
    let fuelText: String
}

struct SeparatorCellViewModel: CarInfoCellVMRepresentable {
    let rowType: CarInfoRowType
    let separatorColor: UIColor
}
