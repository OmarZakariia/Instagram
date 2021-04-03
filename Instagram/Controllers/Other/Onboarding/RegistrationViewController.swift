//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius : CGFloat = 8.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        regsiterButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        
        // Delegates for the fields
        usernameField.delegate = self
        emailField.delegate = self
        passwordTextFeild.delegate = self
        
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordTextFeild)
        view.addSubview(regsiterButton)
        
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assing frames
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 100, width: view.width - 40, height: 52)
        
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 10, width: view.width - 40, height: 52)
        
        passwordTextFeild.frame = CGRect(x: 20, y: emailField.bottom + 10, width: view.width - 40, height: 52)
        
        regsiterButton.frame = CGRect(x: 20, y: passwordTextFeild.bottom + 10, width: view.width - 40, height: 52)
    }
    
    
    
    
    //MARK:- UITextFields
    private let usernameField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Username ..."
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
    
    private let emailField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Email..."
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
    
    private let regsiterButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        
        return  button
    }()

    //MARK: - Functions for buttons when tapped
    @objc private func didTapRegisterButton(){
        // dismiss keyboard for all the fields
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordTextFeild.resignFirstResponder()
        
        // get contnets of the field and make sure that they are correct
        
        guard let email = emailField.text,!email.isEmpty,
              let password = passwordTextFeild.text,!password.isEmpty, password.count >= 8,
        let username = usernameField.text, !username.isEmpty else {
            return
        }
        
        // Registering the user into the database
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { registered in
            DispatchQueue.main.async {
                if registered {
                    // good to go
                } else {
                    // something failed and show an alert
                }
            }
            
        }
        
    }
   
}


//MARK:- UITextFieldDelagetes
extension RegistrationViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        } else if textField == emailField{
            passwordTextFeild.becomeFirstResponder()
        } else {
            didTapRegisterButton()
        }
        
        return true
    }
}
