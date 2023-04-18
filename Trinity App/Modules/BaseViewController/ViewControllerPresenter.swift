//
//  ViewControllerPresenter.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation

class ViewControllerPresenter {
    let interactor: ViewControllerInteractor = ViewControllerInteractor.shared
    func callSimpleApi(completion: @escaping (StarterModel) -> Void) {
        interactor.getBasicCallApi{ result in
            completion(result)
        }
    }
}
