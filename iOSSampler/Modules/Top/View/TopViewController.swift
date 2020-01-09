//
//  TopViewController.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/1/9.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import UIKit

protocol TopView: AnyObject, UITableViewDelegate {
    var tableView: UITableView! { get }
}

final class TopViewController: UIViewController {
    @IBOutlet private(set) weak var tableView: UITableView!
    
    var presenter: TopViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        navigationItem.title = "Top".localized
        tableView.tableFooterView = UIView()
    }
}

extension TopViewController: TopView {
    
}

extension TopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
    }
}
