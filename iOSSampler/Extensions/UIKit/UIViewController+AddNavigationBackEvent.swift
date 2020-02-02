//
//  UIViewController+AddNavigationBackEvent.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/02.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// NavigationBarのBackボタンにイベントをつける
    ///
    /// - warning: UINavigationBarのサブビューからイメージを取得後、Assetsに追加した方がOSの変更の影響が小さくなる
    func addNavigationBackEvent(title: String, action: @escaping TapEvent) {
        
        let backButton = UIButton(type: .system)
        
        backButton.setImage(self.systemNavigationBackImage, for: .normal)
//        backButton.setImage(#imageLiteral(resourceName: "navigation_back_image"), for: .normal)
        
        backButton.imageEdgeInsets = .init(top: 0.0, left: -15.0, bottom: 0.0, right: 0.0)
        backButton.titleEdgeInsets = .init(top: 5.0, left: -5.0, bottom: 5.0, right: 0.0)
        backButton.setTitle(title, for: .normal)
        backButton.sizeToFit()
        
        backButton.tap(action: action)
        
        let backBarButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backBarButton
    }
}

private extension UIViewController {
    
    var systemNavigationBackImage: UIImage? {
        return self.searchSystemImagesInNavigationController().first
    }
    
    /// navigationBarのsubviewsから「＜」のイメージを取得
    func searchSystemImagesInNavigationController() -> [UIImage] {
        guard let imageViews = self.navigationController?.navigationBar.findViews(subclassOf: UIImageView.self) else {
            return []
        }
        if imageViews.isEmpty {
            print("navigationController has no imageView.")
            return []
        }
        
        var images = [UIImage]()
        for imageView in imageViews where imageView.image != nil {
            images.append(imageView.image!)
        }
        return images
    }
    
}
