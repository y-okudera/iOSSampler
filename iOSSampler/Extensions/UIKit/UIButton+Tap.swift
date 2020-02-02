//
//  UIButton+Tap.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/02.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

typealias TapEvent = () -> Void

extension UIButton {
    
    /// ボタンのタップイベントをクロージャで登録する
    func tap(action: @escaping TapEvent) {
        self.eventListener(controlEvents: .touchUpInside, forAction: action)
    }
    
    func eventListener(controlEvents control: UIControl.Event, forAction action: @escaping TapEvent) {
        self.actionHandler(action: action)
        self.addTarget(self, action: #selector(triggerActionHandler), for: control)
    }
}

private extension UIButton {
    
    func actionHandler(action: (TapEvent)? = nil) {
        struct ActionHolder {
            static var action :(TapEvent)?
        }
        if action != nil {
            ActionHolder.action = action
        } else {
            ActionHolder.action?()
        }
    }
    
    @objc func triggerActionHandler() {
        self.actionHandler()
    }
}
