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
            urlString: "https://dummyjson.com/users/",
            parameter: NetworkManager.emptyRequest,
            method: .post,
            responseModel: GoldDashboardFormResponseData.self
        ) { response in
            switch response {
            case .success(let result):
                dump(result)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

}

