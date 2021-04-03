//
//  ViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         handleNotAuthenticated()
       
    }
    
    private func handleNotAuthenticated(){
        // Check the status
        if Auth.auth().currentUser == nil{
            // show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen // that way user cant swipe it away 
            
            present(loginVC, animated: false)
        }
    }
    

}

