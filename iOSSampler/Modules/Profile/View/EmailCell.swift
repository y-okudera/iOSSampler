//
//  EmailCell.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/02.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

final class EmailCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!

    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelEmailItem else {
                return
            }
            
            emailLabel?.text = item.email
        }
    }
}

extension EmailCell: TableViewNibRegistrable {}
