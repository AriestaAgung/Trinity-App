//
//  ViewControllerInteractor.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import Foundation

protocol ViewControllerUseCase {
    func getBasicCallApi(completion: @escaping (StarterModel) -> Void)
}

class ViewControllerInteractor: ViewControllerUseCase {
    static let shared: ViewControllerInteractor = ViewControllerInteractor()
    func getBasicCallApi(completion: @escaping (StarterModel) -> Void) {
        NetworkManager.shared.callApi(
            urlString: "https://jsonplaceholder.typicode.com/todos/2",
            parameter: NetworkManager.emptyRequest,
            method: .get,
            responseModel: StarterModel.self
        ) { response in
            switch response {
            case .success(let result):
                completion(result)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
}
