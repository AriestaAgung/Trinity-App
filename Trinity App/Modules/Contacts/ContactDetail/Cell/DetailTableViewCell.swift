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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
