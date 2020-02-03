//
//  UIViewController+AddNavigationBackEvent.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/02.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// NavigationBarのBackボタンにイベントを登録する
    func addNavigationBackEvent(action: @escaping TapEvent) {
        
        guard let controls = navigationController?.navigationBar.findViews(subclassOf: UIControl.self) else {
            return
        }
        
        for control in controls {
            if control.allTargets.isEmpty {
                continue
            }
            control.removeTarget(nil, action: nil, for: .allEvents)
            control.tap(action: action)
            break
        }
    }
}
