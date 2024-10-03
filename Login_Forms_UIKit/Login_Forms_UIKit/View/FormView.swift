//
//  FormView.swift
//  Login_Forms_UIKit
//
//  Created by Ana Clara Filgueiras Granato on 01/10/2024.
//

import Foundation
import UIKit

class FormView: UIView {
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Idade"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let genderPickerView = UIPickerView()
    let beachPickerView = UIPickerView()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Salvar", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        self.backgroundColor = .white // Define o fundo como branco
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        // Criar rótulos para as perguntas
        let ageLabel = UILabel()
        ageLabel.text = "Qual a sua idade?"
        ageLabel.font = UIFont.boldSystemFont(ofSize: 16)

        let genderLabel = UILabel()
        genderLabel.text = "Qual o seu gênero?"
        genderLabel.font = UIFont.boldSystemFont(ofSize: 16)

        let beachLabel = UILabel()
        beachLabel.text = "Você gosta de praia?"
        beachLabel.font = UIFont.boldSystemFont(ofSize: 16)

        let stackView = UIStackView(arrangedSubviews: [ageLabel, ageTextField, genderLabel, genderPickerView, beachLabel, beachPickerView, nameTextField, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
}
