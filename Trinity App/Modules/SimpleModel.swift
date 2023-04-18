//
//  SimpleModel.swift
//  Trinity App
//
//  Created by BRIMO on 18/04/23.
//

import Foundation


// MARK: - GoldDashboardFormResponseData
struct GoldDashboardFormResponseData: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender: String
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    let eyeColor: String
    let hair: String
    let domain, ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: String
    let ein, ssn, userAgent: String
}

// MARK: - Address
struct Address: Codable {
    let address: String
    let city: String?
    let coordinates: Coordinates
    let postalCode, state: String
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lng: Double
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}
