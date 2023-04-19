//
//  ContactModel.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation

struct ContactModel: Codable {
    let id, firstName, lastName, email: String?
    let dob: String?
}
