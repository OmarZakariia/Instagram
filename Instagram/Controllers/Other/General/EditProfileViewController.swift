//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import UIKit

class  EditProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
    }
    
    //MARK:- Functions for buttons interaction
    
    @objc private func didTapSave(){
    }
    @objc private func didTapCancel(){
    }
    // function to allow the user to change their profile picture
    @objc private func didTapProfilePicture(){
        // show an action sheet, and that sheet will ask the user if they want to take a picture or select one from the camera roll
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        
        // so it wont crash in iPad
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
        
        
    }
    
    //MARK:- Functions
    
    
}
