//
//  TopRouter.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/1/9.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import UIKit

protocol TopWireframe {
    // 画面遷移を定義する
    func showNavigationNext()
}

final class TopRouter {
    
    private weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules(dataSource: TopListDataSource = .init()) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "TopViewController", bundle: .main)
        let view = storyboard
            .instantiateViewController(withIdentifier: "TopViewController") as! TopViewController
        
        let router = TopRouter(viewController: view)
        let interactor = TopInteractor()
        let presenter = TopViewPresenter(view: view, router: router, interactor: interactor, dataSource: dataSource)
        
        view.presenter = presenter
        
        return view
    }
}

extension TopRouter: TopWireframe {
    // 画面遷移を実装する
    func showNavigationNext() {
        let next = NavigationNextRouter.assembleModules()
        self.viewController?.navigationController?.pushViewController(next, animated: true)
    }
}
