//
//  PlistService.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

import Foundation

enum UserError: Error {
    case invalidURL
    case invalidFile
}

class PlistService {
    
    let entityReader = PlistStringReader<User>()
    let productReader = PlistStringReader<Products>()
    
    func getUser() throws -> User {
        return try entityReader.getStrings(name: "User")
    }
    
    func getProducts() throws -> Products {
        return try productReader.getStrings(name: "Products")
    }
    
}
