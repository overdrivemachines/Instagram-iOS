//
//  ViewController.swift
//  Instagram
//
//  Created by Dipen Chauhan on 5/28/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Check Auth Status
        handleNotAuthenticated()
        
    }
    
    private func handleNotAuthenticated() {
        
        if (Auth.auth().currentUser == nil) {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}

