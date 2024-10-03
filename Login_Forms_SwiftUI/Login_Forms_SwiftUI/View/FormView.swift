//
//  FormView.swift
//  Login_Forms_SwiftUI
//
//  Created by Ana Clara Filgueiras Granato on 02/10/2024.
//

import Foundation
import SwiftUI

struct FormView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var age = ""
    @State private var gender = ""
    @State private var likesBeach = ""
    @State private var name = ""
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Idade", text: $age)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Picker("Gênero", selection: $gender) {
                Text("Feminino").tag("Feminino")
                Text("Masculino").tag("Masculino")
                Text("Não Binário").tag("Não Binário")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Picker("Gosta de praia?", selection: $likesBeach) {
                Text("Sim").tag("Sim")
                Text("Não").tag("Não")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            TextField("Nome", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                viewModel.saveData(age: age, gender: gender, likesBeach: likesBeach, name: name)
            }) {
                Text("Salvar")
            }
            .padding()

            NavigationLink(destination: ConfirmationView(), isActive: $viewModel.showConfirmation) {
                EmptyView()
            }
        }
        .padding()
    }
}
