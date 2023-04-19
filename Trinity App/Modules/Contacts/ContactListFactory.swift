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
    
    func createContactDetailPage(data: ContactModel, dataIndex: Int) -> ContactDetailViewController {
        let interactor = ContactDetailInteractor.shared
        let presenter = ContactDetailPresenter(oldData: data, interactor: interactor)
        let vc = ContactDetailViewController(presenter: presenter)
        return vc
        
    }
}
