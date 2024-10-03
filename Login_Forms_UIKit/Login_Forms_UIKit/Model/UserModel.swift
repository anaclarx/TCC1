//
//  UserModel.swift
//  Login_Forms_UIKit
//
//  Created by Ana Clara Filgueiras Granato on 01/10/2024.
//

import Foundation

struct UserModel: Decodable {
    let username: String
    let password: String
    
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
}
