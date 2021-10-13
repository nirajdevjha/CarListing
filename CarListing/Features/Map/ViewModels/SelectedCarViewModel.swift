//
//  SelectedCarViewModel.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import Foundation

struct SelectedCarViewModel: SelectedCarViewData {
    let nameMake: String
    let license: String
    let carImageUrl: String?
    let infoList: [CarInfoViewData]
}

struct CarInfoViewModel: CarInfoViewData {
    let icon: CarListingAssets
    let title: String
}
