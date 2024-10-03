//
//  LoginView.swift
//  Login_Forms_SwiftUI
//
//  Created by Ana Clara Filgueiras Granato on 02/10/2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            Button(action: {
                viewModel.authenticate()
            }) {
                Text("Login")
            }
            .padding()
            
            
            if let error = viewModel.loginError {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
            
            NavigationLink(destination: FormView(viewModel: viewModel), isActive: $viewModel.isAuthenticated) {
                EmptyView()
            }
        }
        .padding()
    }
}
