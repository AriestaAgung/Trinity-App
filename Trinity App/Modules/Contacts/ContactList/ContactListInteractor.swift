//
//  Interactor.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation

protocol ContactListUseCase {
    func getContactList(completion: @escaping ([ContactModel]?) -> Void)
}

class ContactListInteractor: ContactListUseCase {
    static let shared = ContactListInteractor()
}

extension ContactListInteractor {
    func getContactList(completion: @escaping ([ContactModel]?) -> Void) {
        NetworkManager.shared.readMockJSON(name: "contactList") { data, error in
            guard let data = data else {
                print("Error Parsing JSON")
                return
            }
            do {
                let decodedItem = try? JSONDecoder().decode([ContactModel].self, from: data)
                
                if let decodedItem = decodedItem {
                    completion(decodedItem)
                } else {
                    print("Error: decodedItem is nil")
                }
            }
        }
    }
    
}
