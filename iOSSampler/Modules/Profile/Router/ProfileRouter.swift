//
//  ProfileRouter.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/2/2.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import UIKit

protocol ProfileWireframe: AnyObject {
    
}

final class ProfileRouter {
    
    private weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "ProfileViewController", bundle: .main)
        let view = storyboard
            .instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        let router = ProfileRouter(viewController: view)
        let interactor = ProfileInteractor()
        let presenter = ProfileViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        interactor.delegate = presenter
        
        return view
    }
}

extension ProfileRouter: ProfileWireframe {
    
}
