//
//  ConfirmationViewController.swift
//  Login_Forms_UIKit
//
//  Created by Ana Clara Filgueiras Granato on 01/10/2024.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .green
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Voltar", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        animateCheckmark()
        
        let backAction = UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        backButton.addAction(backAction, for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(checkImageView)
        view.addSubview(backButton)
        
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            checkImageView.widthAnchor.constraint(equalToConstant: 100),
            checkImageView.heightAnchor.constraint(equalToConstant: 100),
            
            backButton.topAnchor.constraint(equalTo: checkImageView.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func animateCheckmark() {
        UIView.animate(withDuration: 0.5) {
            self.checkImageView.alpha = 1
        }
    }
}
