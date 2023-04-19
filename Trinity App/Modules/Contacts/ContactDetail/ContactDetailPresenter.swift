//
//  ContactDetailPresenter.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation

protocol ContactDetailPresenterProtocol {
    func updateData()
    func getOldData() -> ContactDetailViewDataModel
}

class ContactDetailPresenter {
    private var interactor: ContactDetailInteractor!
    private var oldData: ContactModel!
    init(oldData: ContactModel, interactor: ContactDetailInteractor) {
        self.interactor = interactor
        self.oldData = oldData
    }
}

extension ContactDetailPresenter: ContactDetailPresenterProtocol {
    func updateData() {
        
    }
    
    func getOldData() -> ContactDetailViewDataModel {
        var mainInfo: [ContactDetailViewData] = []
        var subInfo: [ContactDetailViewData] = []
        oldData.map{ data in
            mainInfo.append(ContactDetailViewData(title: "First Name", value: data.firstName))
            mainInfo.append(ContactDetailViewData(title: "Last Name", value: data.lastName))
            subInfo.append(ContactDetailViewData(title: "Email", value: data.email))
            subInfo.append(ContactDetailViewData(title: "DoB", value: data.dob))
        }
        return ContactDetailViewDataModel(
            mainInformation: mainInfo,
            subInformation: subInfo
        )
    }
    
    
}
