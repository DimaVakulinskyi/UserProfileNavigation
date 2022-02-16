//
//  PlistEntityReader.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

/*import Foundation

class PlistEntityReader <T: Codable>  {
    
    func getEntity(name: String) throws -> T {
        guard let path  = Bundle.main.path(forResource: name, ofType: "plist") else {
            throw UserError.invalidURL
        }
        
        guard let xml  = FileManager.default.contents(atPath: path) else {
            throw UserError.invalidFile
        }
            
        let user = try PropertyListDecoder().decode(T.self, from: xml)

        return user
    
    }
    
}*/

