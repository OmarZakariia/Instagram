//
//  LoginViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
    }
    //MARK: - TextFields
    private let usernameEmailTextField: UITextField = {
        return UITextField()
    }()
    
    private let passwordTextFeild : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    //MARK: - Buttons
    
    private let loginButton: UIButton = {
        return UIButton()
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let createAcountButton: UIButton = {
        return UIButton()
    } ()
    
    //MARK: - HeaderView
    private let headerView: UIView = {
        return UIView()
    }()
    
    
    //MARK: - Functions
    private func addSubviews(){
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordTextFeild)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAcountButton)
        view.addSubview(headerView)
        
        
        
    }
    
    //MARK: - Functions for buttons interaction
    // they need to be marked with @objc so they can be exposed to the buttons
    
    @objc private func didTapLoginButton(){
    }
    
    @objc private func didTapTermsButton(){
        
    }
    
    @objc private func didTapPrivacyButton(){
        
    }
    
    @objc private func didTapCreateAccountButton() {
        
    }
    
}
