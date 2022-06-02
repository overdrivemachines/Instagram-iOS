//
//  LoginViewController.swift
//  Instagram
//
//  Created by Dipen Chauhan on 5/28/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    private let loginButton: UIButton = {
        return UIButton()
    }()
    private let termsButton: UIButton = {
        return UIButton()
    }()
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    private let createAccountButton: UIButton = {
        return UIButton()
    }()
    private let headerView: UIView = {
        return UIView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside LoginVC")
        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 200)
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() { }
    @objc private func didTapTermsButton() { }
    @objc private func didTapPrivacyButton() { }
    @objc private func didTapCreateAccountButton() { }
}
