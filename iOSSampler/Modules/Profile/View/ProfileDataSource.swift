//
//  ProfileDataSource.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/02/03.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

enum ProfileViewModelItemType {
    case nameAndPicture
    case about
    case email
    case friend
    case attribute
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

final class ProfileDataSource: NSObject {
    
    private(set) var items: [ProfileViewModelItem]
    
    override init() {
        items = []
        super.init()
    }
    
    init(userProfileData: UserProfileData) {
        items = userProfileData.makeProfileViewModelItems()
    }
}

extension ProfileDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.section]
        switch item.type {
        case .nameAndPicture:
            
            let cell: NamePictureCell = tableView.dequeueReusableCell(for: indexPath)
            cell.item = item
            return cell
            
        case .about:
            
            let cell: AboutCell = tableView.dequeueReusableCell(for: indexPath)
            cell.item = item
            return cell
            
        case .email:
            
            let cell: EmailCell = tableView.dequeueReusableCell(for: indexPath)
            cell.item = item
            return cell
            
        case .friend:
            
            if let item = item as? ProfileViewModeFriendsItem {
                let cell: FriendCell = tableView.dequeueReusableCell(for: indexPath)
                let friend = item.friends[indexPath.row]
                cell.item = friend
                return cell
            }
            
        case .attribute:
            
            if let item = item as? ProfileViewModeAttributeItem {
                let cell: AttributeCell = tableView.dequeueReusableCell(for: indexPath)
                cell.item = item.attributes[indexPath.row]
                return cell
            }
        }
        
        assertionFailure("Cell type not match.")
        return UITableViewCell()
    }
}

final class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    
    var sectionTitle: String {
        return "Main Info"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}

final class ProfileViewModelAboutItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .about
    }
    
    var sectionTitle: String {
        return "About"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

final class ProfileViewModelEmailItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .email
    }
    
    var sectionTitle: String {
        return "Email"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var email: String
    
    init(email: String) {
        self.email = email
    }
}

final class ProfileViewModeAttributeItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .attribute
    }
    
    var sectionTitle: String {
        return "Attributes"
    }
    
    var rowCount: Int {
        return attributes.count
    }
    
    var attributes: [ProfileAttribute]
    
    init(attributes: [ProfileAttribute]) {
        self.attributes = attributes
    }
}

final class ProfileViewModeFriendsItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .friend
    }
    
    var sectionTitle: String {
        return "Friends"
    }
    
    var rowCount: Int {
        return friends.count
    }
    
    var friends: [FriendProfileData]
    
    init(friends: [FriendProfileData]) {
        self.friends = friends
    }
}
