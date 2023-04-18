//
//  SimpleModel.swift
//  Trinity App
//
//  Created by BRIMO on 18/04/23.
//

import Foundation
struct StarterModel: Codable {
    let userID, id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
