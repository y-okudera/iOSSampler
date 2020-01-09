//
//  __PREFIX__Router.swift
//  __TARGET__
//
//  Created by __USERNAME__ on __DATE__.
//  Copyright © __YEAR__ __USERNAME__. All rights reserved.
//

import UIKit

protocol __PREFIX__Wireframe: AnyObject {
    
}

final class __PREFIX__Router {
    
    private weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "__PREFIX__ViewController", bundle: .main)
        let view = storyboard
            .instantiateViewController(withIdentifier: "__PREFIX__ViewController") as! __PREFIX__ViewController
        
        let router = __PREFIX__Router(viewController: view)
        let interactor = __PREFIX__Interactor()
        let presenter = __PREFIX__ViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension __PREFIX__Router: __PREFIX__Wireframe {
    
}
