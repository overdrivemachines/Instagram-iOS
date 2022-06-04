//
//  LoginViewController.swift
//  Instagram
//
//  Created by Dipen Chauhan on 5/28/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email or Username..."
        field.keyboardType = .emailAddress
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10 , height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        // Corner Radius
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10 , height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        // Corner Radius
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let termsButton: UIButton = {
        return UIButton()
    }()
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside LoginVC - viewDidLoad()")
        // Assign Deligates
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.height/3.0)
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        print("configureHeaderView() - custom")
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        // Add Instagram Logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height - view.safeAreaInsets.top)
        
        // Username Position
        usernameEmailField.frame = CGRect(x: 25, y: headerView.bottom + 10, width: headerView.width - 50, height: 52)
        
        // Password Position
        passwordField.frame = CGRect(x: 25, y: usernameEmailField.bottom + 10, width: headerView.width - 50, height: 52)
        
        // Login Button Position
        loginButton.frame = CGRect(x: 25, y: passwordField.bottom + 10, width: headerView.width - 50, height: 52)
        
        // Create Account Button Position
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: headerView.width - 50, height: 52)
        
    }
    
    private func addSubviews() {
        print("addSubviews() - custom")
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {
        print("didTapLoginButton()")
    }
    @objc private func didTapTermsButton() { }
    @objc private func didTapPrivacyButton() { }
    @objc private func didTapCreateAccountButton() { }
}

extension LoginViewController: UITextFieldDelegate {
    // When 'return' key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == usernameEmailField) {
            passwordField.becomeFirstResponder()
        }
        else if (textField == passwordField) {
            didTapLoginButton()
        }
        return true
    }
     
}


