//
//  ContactListFactory.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation

class ContactListFactory {
    static let shared: ContactListFactory = ContactListFactory()
}

extension ContactListFactory {
    func createContactListPage() -> ContactListViewController{
        let presenter = ContactListPresenter.shared
        let vc = ContactListViewController(presenter: presenter)
        return vc
    }
}
