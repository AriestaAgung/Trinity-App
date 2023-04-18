//
//  ViewController.swift
//  Trinity App
//
//  Created by BRIMO on 18/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        getNetwork()
    }

    private func getNetwork() {
        NetworkManager.shared.callApi(
            urlString: "https://jsonplaceholder.typicode.com/todos/2",
            parameter: NetworkManager.emptyRequest,
            method: .get,
            responseModel: StarterModel.self
        ) { response in
            switch response {
            case .success(let result):
                dump(result)
            case .failure(let err):
                print(err)
            }
        }
    }

}

