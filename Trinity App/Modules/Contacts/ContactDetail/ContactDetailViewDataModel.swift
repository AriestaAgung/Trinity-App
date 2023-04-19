//
//  ContactDetailViewModel.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation
struct ContactDetailViewDataModel {
    let mainInformation: [ContactDetailViewData]
    let subInformation: [ContactDetailViewData]
}

struct ContactDetailViewData {
    let title: String?
    let value: String?
}
