//
//  ProfileInteractor.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/2/2.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import Foundation

protocol ProfileUsecase {
    func readJSON(json: String)
}

protocol ProfileInteractorDelegate: class {
    func didFinishReading(data: UserProfileData)
}

final class ProfileInteractor {
    weak var delegate: ProfileInteractorDelegate?
}

extension ProfileInteractor: ProfileUsecase {
    func readJSON(json: String) {
        let reader = JSONFileReader(jsonFileName: json, decodeType: UserProfile.self)
        reader.decode { result in
            switch result {
            case .success(let userProfile):
                if let profileData = userProfile.data {
                    delegate?.didFinishReading(data: profileData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

