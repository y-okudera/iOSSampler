//
//  TopViewPresenter.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/1/9.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import Foundation

protocol TopViewPresentation {
    func viewDidLoad()
    func tappedCell(indexPath: IndexPath)
}


final class TopViewPresenter {

    private weak var view: TopView?
    private let router: TopWireframe
    private let interactor: TopUsecase
    private(set) var topListDataSource: TopListDataSource
    
    init(view: TopView,
         router: TopWireframe,
         interactor: TopUsecase,
         dataSource: TopListDataSource) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.topListDataSource = dataSource
    }
}

extension TopViewPresenter: TopViewPresentation {
    
    func viewDidLoad() {
        view?.tableView.dataSource = self.topListDataSource
        view?.tableView.delegate = view
        view?.tableView.reloadData()
    }
    
    func tappedCell(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            router.showNavigationNext()
        case 1:
            router.showProfile()
        default:
            print("default")
        }
    }
}

