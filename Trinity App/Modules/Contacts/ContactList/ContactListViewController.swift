//
//  ContactListViewController.swift
//  Trinity App
//
//  Created by BRIMO on 19/04/23.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    private var presenter: ContactListPresenter!
    private let refreshControl = UIRefreshControl()
    
    init(presenter: ContactListPresenter) {
        self.presenter = presenter
        super.init(nibName: "ContactListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchAction))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = searchButton
        
        
        presenter.getContactList()
        mainCollectionView.register(
            UINib(
                nibName: ContactCollectionViewCell.NIB,
                bundle: nil
            ),
            forCellWithReuseIdentifier: ContactCollectionViewCell.identifier
        )
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    }
    
    @objc private func refreshAction() {
        refreshControl.beginRefreshing()
        self.presenter.getContactList()
        mainCollectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc private func addAction() {
        
    }
    
    @objc private func searchAction() {
        
    }
}

extension ContactListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.contactData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCollectionViewCell.identifier, for: indexPath) as! ContactCollectionViewCell
        if let currentData = presenter.contactData?[indexPath.row] {
            cell.nameLabel.text = currentData.firstName
        }
        
        return cell
    }
    
    
}

extension ContactListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width - 48
        return CGSize(width: collectionViewSize/2, height: 128)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = presenter.contactData {
            let vc = ContactListFactory.shared.createContactDetailPage(data: data[indexPath.row], dataIndex: indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
