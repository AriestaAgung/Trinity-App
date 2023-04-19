//
//  DetailTableViewCell.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainTextField: UITextField!
    static let nib: UINib = UINib(nibName: "DetailTableViewCell", bundle: nil)
    static let identifier: String = "DetailTableViewCell"
    @objc var textFieldDidBeginEditing: (() -> Void)?
    @objc var textFieldDidEndEditing: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainTextField.addTarget(self, action: #selector(endEditingAction), for: .editingDidEnd)
        
        self.mainTextField.addTarget(self, action: #selector(beginEditingAction), for: .editingDidBegin)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc private func endEditingAction() {
        textFieldDidEndEditing?()
    }
    @objc private func beginEditingAction() {
        textFieldDidBeginEditing?()
    }
}
