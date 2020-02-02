//
//  ProfileViewController.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/2/2.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import UIKit

protocol ProfileView: AnyObject {
    var tableView: UITableView! { get }
    func reloadView()
}

final class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ProfileViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        presenter.fetchUserProfile()
    }
    
    private func setup() {
        navigationItem.title = "Profile".localized
        
        NamePictureCell.register(tableView: self.tableView)
        AboutCell.register(tableView: self.tableView)
        FriendCell.register(tableView: self.tableView)
        AttributeCell.register(tableView: self.tableView)
        EmailCell.register(tableView: self.tableView)
    }
}

extension ProfileViewController: ProfileView {
    func reloadView() {
        tableView.reloadData()
    }
}

