//
//  ViewController.swift
//  Trinity App
//
//  Created by BRIMO on 18/04/23.
//

import UIKit

class ViewController: UIViewController {
    let presenter = ViewControllerPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        getNetwork()
    }

    private func getNetwork() {
        presenter.callSimpleApi{ result in
            let alert = UIAlertController(title: "Fetch Data Success", message: "RequestedName: \(result.title ?? "")", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.dismiss(animated: true)
            })
            alert.addAction(action)
            self.present(alert, animated: true)            
        }
    }

}

