//
//  UserProfile.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/03.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import Foundation

struct UserProfile: Decodable {
    let data: UserProfileData?
    let error: Int?
    let message: String?
}

struct UserProfileData: Decodable {
    let id: Int?
    let fullName: String?
    let pictureUrl: String?
    let email: String?
    let about: String?
    let friends: [FriendProfileData]?
    let profileAttributes: [ProfileAttribute]?
    
    func makeProfileViewModelItems() -> [ProfileViewModelItem] {
        var items = [ProfileViewModelItem]()
        
        if let name = fullName, let pictureUrl = pictureUrl {
            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
            items.append(nameAndPictureItem)
        }
        
        if let about = about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            items.append(aboutItem)
        }
        
        if let email = email {
            let dobItem = ProfileViewModelEmailItem(email: email)
            items.append(dobItem)
        }
        
        if let attributes = profileAttributes {
            if !attributes.isEmpty {
                let attributesItem = ProfileViewModeAttributeItem(attributes: attributes)
                items.append(attributesItem)
            }
        }
        
        if let friends = friends {
            if !friends.isEmpty {
                let friendsItem = ProfileViewModeFriendsItem(friends: friends)
                items.append(friendsItem)
            }
        }
        return items
    }
}

struct FriendProfileData: Decodable {
    let name: String?
    let pictureUrl: String?
}

struct ProfileAttribute: Decodable {
    let key: String?
    let value: String?
}
