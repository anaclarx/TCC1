//
//  UserModel.swift
//  Login_Forms_SwiftUI
//
//  Created by Ana Clara Filgueiras Granato on 02/10/2024.
//

import Foundation
struct UserModel: Codable {
    
    var username: String
    var password: String

    static func loadCredentials() -> UserModel?{
        if let url = Bundle.main.url(forResource: "LoginCredentials", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let credentials = try JSONDecoder().decode(UserModel.self, from: data)
                
                return credentials
            } catch{
                print("Error loading JSON: \(error)")
                return nil
            }
        }
        return nil
    }
    
    static func saveToJSON(user: UserModel){
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let filePath = documentDirectory.appendingPathComponent("SavedUser.json")
            do{
                let data = try JSONEncoder().encode(user)
                try data.write(to: filePath)
            } catch {
                print("Error saving JSON: \(error)")
            }
        }
    }
    
}
