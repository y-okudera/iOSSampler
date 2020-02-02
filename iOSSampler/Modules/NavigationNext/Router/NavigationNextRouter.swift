//
//  NavigationNextRouter.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/1/9.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import UIKit

protocol NavigationNextWireframe {
    
}

final class NavigationNextRouter {
    
    private weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "NavigationNextViewController", bundle: .main)
        let view = storyboard
            .instantiateViewController(withIdentifier: "NavigationNextViewController") as! NavigationNextViewController
        
        let router = NavigationNextRouter(viewController: view)
        let interactor = NavigationNextInteractor()
        let presenter = NavigationNextViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension NavigationNextRouter: NavigationNextWireframe {
    
}
