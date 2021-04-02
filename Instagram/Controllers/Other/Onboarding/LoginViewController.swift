//
//  LoginViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import SafariServices
import UIKit

class LoginViewController: UIViewController {
    
    // struct for constants
    struct Constants {
        static let cornerRadius : CGFloat = 8.0
    }
    
    override func viewDidLoad() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside) // touch up inside is the basic tap
        
        createAcountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        
        super.viewDidLoad()
        usernameEmailTextField.delegate = self
        passwordTextFeild.delegate = self
        
        
        
        addSubviews()
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        headerView.frame = CGRect(
            x: 0,
            y: 0.0,
            width: view.width,
            height: view.height/3.0)
        
        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40 ,
            width: view.width - 50 ,
            height: 52)
        
        passwordTextFeild.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.bottom + 10 ,
            width: view.width - 50,
            height: 52)
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordTextFeild.bottom + 10 ,
            width: view.width - 50,
            height: 52)
        
        createAcountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10 ,
            width: view.width - 50,
            height: 52)
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 20,
            height: 50)
        
        privacyButton.frame =  CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width - 20,
            height: 50 )
        
        configureHeaderView()
    }
    //MARK: - TextFields
    private let usernameEmailTextField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
//        field.borderStyle = .line
        
        return field
    }()
    
    private let passwordTextFeild : UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.isSecureTextEntry = true
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    //MARK: - Buttons
    
    private let loginButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        return  button
    }()
    
    private let termsButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAcountButton: UIButton = {
        let button =  UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        
        return button
    } ()
    
    //MARK: - HeaderView
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView =  UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
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
    
    private func configureHeaderView(){
        guard headerView.subviews.count ==  1 else {
            return
        }
        
        guard let  backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        // Add instagram logo
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width / 4 ,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width / 2.0 ,
                                 height: headerView.height - view.safeAreaInsets.top)
    }
    
    //MARK: - Functions for buttons interaction
    // they need to be marked with @objc so they can be exposed to the buttons
    
    @objc private func didTapLoginButton(){
        usernameEmailTextField.resignFirstResponder() // to dismiss the keyboard
        passwordTextFeild.resignFirstResponder()
        
        // double check that we have text and check that its not empty and do the same thing for the password field, and require that the password is at least 8 characters long
        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
              let password = passwordTextFeild.text, !password.isEmpty, password.count >= 8 else{
            return
        }
        // Implement login functionality
        
    }
    
    @objc private func didTapTermsButton(){
        // if the user taps the terms button, open up instagram terms
        // I have to say guard let because the URL may not be valid
        guard let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    @objc private func didTapPrivacyButton(){
        // If the user taps the privacy buttom, open up instagram privacy
        // I have to say guard let because the URL may not be valid
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
// MARK:- UITexfieldDelegate Extension
extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailTextField{
            passwordTextFeild.becomeFirstResponder()
        } else if textField == passwordTextFeild {
            didTapLoginButton()
        }
        return true
    }
}

