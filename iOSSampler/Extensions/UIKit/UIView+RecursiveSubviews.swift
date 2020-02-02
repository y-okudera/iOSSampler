//
//  UIView+RecursiveSubviews.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/02.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

extension UIView {
    /// 再帰的にサブビューを取得する
    var recursiveSubviews: [UIView] {
        return subviews + subviews.flatMap { $0.recursiveSubviews }
    }
    
    /// UIViewの特定サブクラスのビューを取得する
    func findViews<T: UIView>(subclassOf: T.Type) -> [T] {
        return recursiveSubviews.compactMap { $0 as? T }
    }
}

