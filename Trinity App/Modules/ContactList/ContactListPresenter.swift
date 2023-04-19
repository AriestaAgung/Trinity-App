//
//  ContactListPresenter.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation

protocol ContactListPresenterProtocol {
    func getContactList()
}

class ContactListPresenter: ContactListPresenterProtocol {
    static let shared: ContactListPresenter = ContactListPresenter()
    private let interactor: ContactListInteractor = ContactListInteractor.shared
    var contactData: [ContactModel]?
}

extension ContactListPresenter {
    func getContactList() {
        interactor.getContactList { contactData in
            self.contactData = contactData
        }
    }
    
}
