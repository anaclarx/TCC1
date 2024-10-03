//
//  FormViewController.swift
//  Login_Forms_UIKit
//
//  Created by Ana Clara Filgueiras Granato on 01/10/2024.
//

import Foundation
import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let formView = FormView()
    
    override func loadView() {
        self.view = formView
        self.view.backgroundColor = .white // Define o fundo como branco
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formView.genderPickerView.delegate = self
        formView.genderPickerView.dataSource = self
        formView.beachPickerView.delegate = self
        formView.beachPickerView.dataSource = self
        
        // Configurar ação do botão Salvar
        formView.saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    @objc func saveTapped() {
        let age = formView.ageTextField.text ?? ""
        let gender = FormModel.genderOptions[formView.genderPickerView.selectedRow(inComponent: 0)]
        let beach = FormModel.beachOptions[formView.beachPickerView.selectedRow(inComponent: 0)]
        let name = formView.nameTextField.text ?? ""
        
        let formData: [String: Any] = [
            "age": age,
            "gender": gender,
            "beach": beach,
            "name": name
        ]
        
        saveToJSON(data: formData)
        
        let confirmationVC = ConfirmationViewController()
        navigationController?.pushViewController(confirmationVC, animated: true)
    }

    func saveToJSON(data: [String: Any]) {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentsDirectory.appendingPathComponent("formData.json")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            try jsonData.write(to: fileURL)
            print("Dados salvos com sucesso em \(fileURL.path)")
        } catch {
            print("Erro ao salvar os dados: \(error)")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == formView.genderPickerView {
            return FormModel.genderOptions.count
        } else {
            return FormModel.beachOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == formView.genderPickerView {
            return FormModel.genderOptions[row]
        } else {
            return FormModel.beachOptions[row]
        }
    }
}
