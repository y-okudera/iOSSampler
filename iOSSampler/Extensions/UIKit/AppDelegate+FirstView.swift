//
//  AppDelegate+FirstView.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/01/09.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    /// アプリ起動後、最初に表示する画面を設定する
    ///
    /// - Parameters:
    ///   - viewController: 最初に表示する画面のViewController
    ///   - includeNavigationController: NavigationControllerを含めるかどうか
    func firstView(viewController: UIViewController, includeNavigationController: Bool = false) {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if includeNavigationController {
            let navigationController = UINavigationController(rootViewController: viewController)
            window?.rootViewController = navigationController
        } else {
            window?.rootViewController = viewController
        }
        window?.makeKeyAndVisible()
    }
}
