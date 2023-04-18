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
                let alert = UIAlertController(title: "Fetch Data Success", message: "RequestedName: \(result.title ?? "")", preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "OK", style: .default, handler: {_ in
                    self.dismiss(animated: true)
                })
                alert.addAction(action)
                self.present(alert, animated: true)
            case .failure(let err):
                print(err)
            }
        }
    }

}

