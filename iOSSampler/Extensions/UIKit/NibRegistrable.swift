//
//  NibRegistrable.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/02.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

// MARK: - TableViewNibRegistrable
protocol TableViewNibRegistrable where Self: UITableViewCell {
    
    /// TableViewにNibを登録する
    ///
    /// - Parameter tableView: 登録先のTableView
    static func register(tableView: UITableView)
}

extension TableViewNibRegistrable {
    
    static func register(tableView: UITableView) {
        let nib = UINib(nibName: identifier, bundle: Bundle(for: self))
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}
