//
//  NavigationNextViewPresenter.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/1/9.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import Foundation

protocol NavigationNextViewPresentation {

    func viewDidLoad()    
}


final class NavigationNextViewPresenter {

    private weak var view: NavigationNextView?
    private let router: NavigationNextWireframe
    private let interactor: NavigationNextUsecase
    
    init(view: NavigationNextView,
         router: NavigationNextWireframe,
         interactor: NavigationNextUsecase) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension NavigationNextViewPresenter: NavigationNextViewPresentation {
    
    func viewDidLoad() {
        
    }
}

