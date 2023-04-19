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
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    private var presenter: ContactDetailPresenter!
    private var datePicker = UIDatePicker()
    private var datePickerDate: Date?
    private var datePickerDidSelectDate: (() -> Void)?
    
    init(presenter: ContactDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: "ContactDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.navigationController?.navigationItem.backButtonTitle = ""
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        self.navigationController?.navigationItem.backBarButtonItem = backButton
        self.avatarView.backgroundColor = UIColor.orange
        self.avatarView.layer.cornerRadius = self.avatarView.frame.height/2
        self.detailTableView.register(DetailTableViewCell.nib, forCellReuseIdentifier: DetailTableViewCell.identifier)
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.separatorStyle = .none
        self.detailTableView.isScrollEnabled = false
        let totalData: Int = {
            let firstData = self.presenter.getOldData().mainInformation.count
            let subData = self.presenter.getOldData().subInformation.count
            return firstData + subData
        }()
        
        self.tableViewHeightConstraint.constant = CGFloat(totalData) * 100
        print(self.tableViewHeightConstraint.constant)
        handleKeyboardDismissOnViewTapped()
    }
    
    private func handleKeyboardDismissOnViewTapped() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    
    
    @objc private func cancelAction() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func saveAction() {
        
    }
    
    @objc private func openCalendarPicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(getDataAction), for: .valueChanged)
        
        self.view.addSubview(datePicker)
        
    }
    

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func getDataAction(_ sender: UIDatePicker) {
        self.datePickerDate = sender.date
        datePickerDidSelectDate?()
        datePicker.removeFromSuperview()
    }
}

extension ContactDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return presenter.getOldData().mainInformation.count
        } else if section == 1 {
            return presenter.getOldData().subInformation.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier) as! DetailTableViewCell
        if indexPath.section == 0 {
            let data = presenter.getOldData().mainInformation
            cell.titleLabel.text = data[indexPath.row].title
            cell.mainTextField.text = data[indexPath.row].value
            cell.textFieldDidEndEditing = {
                if indexPath.row + 1 != data.endIndex  {
                    
                    let newIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
                    (tableView.cellForRow(at: indexPath) as! DetailTableViewCell).mainTextField.resignFirstResponder()
                    self.dismissKeyboard()
                    (tableView.cellForRow(at: newIndexPath) as! DetailTableViewCell).mainTextField.becomeFirstResponder()
                }
            }
        } else if indexPath.section == 1 {
            let data = presenter.getOldData().subInformation
            cell.titleLabel.text = data[indexPath.row].title
            cell.mainTextField.text = data[indexPath.row].value
            if indexPath.row == data.endIndex {
                cell.textFieldDidBeginEditing = {
                    cell.mainTextField.inputView = self.datePicker
                }
                datePickerDidSelectDate = {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "dd/MMMM/yyyy"
                        cell.mainTextField.text = formatter.string(from: self.datePickerDate ?? Date())
                }
                    
            }
        }
        cell.selectionStyle = .none
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
        if section == 0 {
            sectionTitle.text = "Main Information"
        } else {
            sectionTitle.text = "Sub Information"
        }
        baseView.backgroundColor = .gray
        baseView.addSubview(sectionTitle)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionTitle.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            sectionTitle.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 16),
            sectionTitle.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -16),
        ])
        return baseView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        32
    }
}
