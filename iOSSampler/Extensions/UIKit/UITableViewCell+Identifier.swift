//
//  UITableViewCell+Identifier.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/01/09.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}
