//
//  ContactDetailViewController.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var avatarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.avatarView.backgroundColor = UIColor.orange
        self.avatarView.layer.cornerRadius = self.avatarView.frame.height/2
        self.detailTableView.register(DetailTableViewCell.nib, forCellReuseIdentifier: DetailTableViewCell.identifier)
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
    }


}

extension ContactDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier) as! DetailTableViewCell
        
        return cell
    }
}
extension ContactDetailViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let baseView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 32))
        let sectionTitle = UILabel()
        let separator = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        if section == 0 {
            sectionTitle.text = "Main Information"
            baseView.backgroundColor = .darkGray
        } else {
            sectionTitle.text = "Sub Information"
            baseView.backgroundColor = .gray
        }
        baseView.backgroundColor = .gray
        baseView.addSubview(sectionTitle)
        baseView.addSubview(separator)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionTitle.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            sectionTitle.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 16),
            sectionTitle.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -16),
            separator.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: baseView.bottomAnchor)
        ])
        return baseView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        32
    }
}
