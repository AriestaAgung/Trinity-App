//
//  ContactCollectionViewCell.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarCircleView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let NIB: String = "ContactCollectionViewCell"
    static let identifier: String = "ContactCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarCircleView.layer.cornerRadius = self.avatarCircleView.frame.height/2
        self.avatarCircleView.backgroundColor = UIColor.orange
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.cornerRadius = 10
    }

}
