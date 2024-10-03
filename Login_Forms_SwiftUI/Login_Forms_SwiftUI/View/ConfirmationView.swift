//
//  ConfirmationView.swift
//  Login_Forms_SwiftUI
//
//  Created by Ana Clara Filgueiras Granato on 02/10/2024.
//

import Foundation
import SwiftUI

struct ConfirmationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .opacity(1)
            
            Text("As alterações foram salvas!")
                .font(.title)
                .padding()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Voltar")
            }
            .padding()
        }
    }
}
