//
//  User.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 13.11.2021.
//

import Foundation
import UIKit

struct User: Codable {
    
    let FirstName: String
    let LastName: String
    let DateOfBirth: String
    let PhoneNumber: String
    let Country: String
    let State: String
    let City: String
    let Address: String
    let PostalCode: String
}
