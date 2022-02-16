//
//  UserViewModel.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 13.11.2021.
//

import Foundation
import UIKit

enum Content {
    case image(image: UIImage)
    case item(_ item: Item)
}

struct Section {
    var title: String
    var item: [Content]
}

struct Item {
    let title: String
    let value: String
}

class UserViewModel {
    
    var user: User?
    let service = PlistService()
    let images = UIImage(named: "1") ?? UIImage()
    var sections: [Section] {
        let image = Section(title: "", item: [.image(image: images)])
        let basicInfo = Section(title: "Basic Info", item:
                                    [.item(Item(title: "FirstName", value: user?.FirstName ?? "")),
                                     .item(Item(title: "LastName", value: user?.LastName ?? "")),
                                     .item(Item(title: "DateOfBirth", value: user?.DateOfBirth ?? "")),
                                     ])
        let phoneInfo = Section(title: "Phone Number", item:
                                    [.item(Item(title: "PhoneNumber", value: user?.PhoneNumber ?? ""))])
        
        let addressInfo = Section(title: "Address", item:
                                    [.item(Item(title: "Country", value: user?.Country ?? "")),
                                     .item(Item(title: "State", value: user?.State ?? "")),
                                     .item(Item(title: "City", value: user?.City ?? "")),
                                     .item(Item(title: "Address", value: user?.Address ?? "")),
                                     .item(Item(title: "PostalCode", value: user?.PostalCode ?? ""))])
        return [image, basicInfo, phoneInfo, addressInfo]
    }
    
    func updateUser() throws {
        self.user = try service.getUser()
    }
    
    
    
    
}
