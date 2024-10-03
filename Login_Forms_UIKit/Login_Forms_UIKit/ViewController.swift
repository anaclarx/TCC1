//
//  ViewController.swift
//  Login_Forms_UIKit
//
//  Created by Ana Clara Filgueiras Granato on 01/10/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let bundlePath = Bundle.main.path(forResource: "LoginCredentials", ofType: "json") {
            print("JSON found at path: \(bundlePath)")
        } else {
            print("JSON not found in bundle")
        }

    }


}

