//
//  LoginViewController.swift
//  Login_Forms_UIKit
//
//  Created by Ana Clara Filgueiras Granato on 01/10/2024.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    var userModel: UserModel?
    
    override func loadView() {
        self.view = loginView
        self.view.backgroundColor = .white // Define o fundo como branco
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userModel = UserModel.loadCredentials()
        
        let loginAction = UIAction { [weak self] _ in
            self?.loginTapped()
        }
        loginView.loginButton.addAction(loginAction, for: .touchUpInside)
    }
    
    func loginTapped() {
        guard let username = loginView.usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password = loginView.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        if userModel?.username == username && userModel?.password == password {
            let formVC = FormViewController()
            navigationController?.pushViewController(formVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Invalid Credentials", message: "Username or password is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
