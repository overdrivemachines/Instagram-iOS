//
//  LoginViewController.swift
//  Instagram
//
//  Created by Dipen Chauhan on 5/28/22.
//

import UIKit
import SafariServices

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
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
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
        
        // Adding Targets
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
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
        usernameEmailField.frame = CGRect(x: 25, y: headerView.bottom + 40, width: headerView.width - 50, height: 52)
        
        // Password Position
        passwordField.frame = CGRect(x: 25, y: usernameEmailField.bottom + 10, width: headerView.width - 50, height: 52)
        
        // Login Button Position
        loginButton.frame = CGRect(x: 25, y: passwordField.bottom + 10, width: headerView.width - 50, height: 52)
        
        // Create Account Button Position
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: headerView.width - 50, height: 52)
        
        // Terms Button Position
        termsButton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 100, width: view.width - 20, height: 50)
        
        // Privacy Button Position
        privacyButton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 50, width: view.width - 20, height: 50)
        
    }
    
    private func addSubviews() {
        print("addSubviews() - custom")
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {
        print("didTapLoginButton()")
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        // Check if username email and password exist
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,  let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        // Login Functionality
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            // email
            email = usernameEmail
            print("Log In Email: \(email as Optional)")
        }
        else {
            // username
            username = usernameEmail
            print("Log In Username: \(username as Optional)")
        }
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // user logged in
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    // error occured
                    let alert = UIAlertController(title: "Log In Error", message: "We were unable to log you in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    @objc private func didTapTermsButton() {
        // View Terms in Safari View
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapPrivacyButton() {
        // View Privacy in Safari View
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
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


