//
//  ProfileViewPresenter.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/2/2.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import Foundation

protocol ProfileViewPresentation: AnyObject {
    func fetchUserProfile()
}


final class ProfileViewPresenter {

    private weak var view: ProfileView?
    private let router: ProfileWireframe
    private let interactor: ProfileUsecase
    private var profileDataSource: ProfileDataSource?
    
    init(view: ProfileView,
         router: ProfileWireframe,
         interactor: ProfileUsecase) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ProfileViewPresenter: ProfileViewPresentation {
    
    func fetchUserProfile() {
        print(#function)
        interactor.readJSON(json: "UserProfile.json")
    }
}

extension ProfileViewPresenter: ProfileInteractorDelegate {
    func didFinishReading(data: UserProfileData) {
        self.profileDataSource = ProfileDataSource(userProfileData: data)
        view?.tableView.dataSource = self.profileDataSource
//        view?.reloadView()
    }
}
