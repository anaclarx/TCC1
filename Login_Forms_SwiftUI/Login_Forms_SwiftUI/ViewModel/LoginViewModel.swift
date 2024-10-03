//
//  LoginViewModel.swift
//  Login_Forms_SwiftUI
//
//  Created by Ana Clara Filgueiras Granato on 02/10/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var userModel: UserModel?
    @Published var isAuthenticated = false
    @Published var showConfirmation = false
    @Published var loginError: String? // Mensagem de erro de login
    
    init() {
        userModel = UserModel.loadCredentials()
    }
    
    func authenticate() {
        if let user = userModel {
            if username == user.username && password == user.password {
                isAuthenticated = true
                loginError = nil 
            } else {
                isAuthenticated = false
                loginError = "Credenciais incorretas. Tente novamente."
            }
        } else {
            loginError = "Erro ao carregar as credenciais."
        }
    }
    
    func saveData(age: String, gender: String, likesBeach: String, name: String) {
        let newUser = UserModel(username: username, password: password)
        UserModel.saveToJSON(user: newUser)
        showConfirmation = true
    }
}
