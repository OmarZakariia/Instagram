//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import UIKit
import SafariServices



struct SettingCellModel {
    let title: String
    let handler : (()-> Void)
}

/// View Controller to show user settings
final class SettingsViewController: UIViewController {
    
    //MARK:- Variables and Constants
    // final wont allow anyone to subclass the class
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureModels()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        tableView.frame = view.bounds
        
    }
    
    //MARK:-   Enums and Structs
    enum SettingsURLType {
        case terms, privacy, help
    }
    
    //MARK:- Functions for buttons interactions
     private func didTapLogout(){
        // show action sheet to the user and confirm that they want to logout
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { (success) in
                DispatchQueue.main.async {
                    if success {
                        // present log in screen
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                            
                        }
                        
                    }
                    else {
                        // something went wrong
                        fatalError("Could not log out user")
                    }
                }
            }
        }))
        
        // so it wont crash on iPad
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
        
    }
    private func didTapSaveOriginalPosts(){
        
    }
    
    private func didTapEditProfile(){
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
        
    }
    
    private func didTapInviteFriends(){
        // Show share sheet to invite friends
    }
    
   
    
    private func openURL(type: SettingsURLType){
        
        let urlString : String
        
        switch type {
        case .terms: urlString = "https://www.instagram.com/about/legal/terms/before-january-19-2013/"
        case .privacy: urlString = "https://help.instagram.com/519522125107875"
        case .help: urlString = "https://help.instagram.com"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    //MARK:- Functions
    private func configureModels() {
        data.append([
            SettingCellModel(title: "Edit Profile", handler: { [weak self] in
                self?.didTapEditProfile()
                
                
            }),
            SettingCellModel(title: "Invite Friends", handler: { [weak self] in
                self?.didTapInviteFriends()
                
            }),
            SettingCellModel(title: "Save Original Posts", handler: { [weak self] in
                self?.didTapSaveOriginalPosts()
            })
        ])
        
       

        data.append([
            SettingCellModel(title: "Terms Of Service", handler: { [weak self] in
                self?.openURL(type: .terms)
                
            })
        ])

        data.append([
            SettingCellModel(title: "Privacy Policy", handler: { [weak self] in
                self?.openURL(type: .privacy)
                
            })
        ])
        
        data.append([
            SettingCellModel(title: "Help / Feeedback", handler: { [weak self] in
                self?.openURL(type: .help)
            })
        ])
        
        
        data.append([
            SettingCellModel(title: "Log Out", handler: { [weak self] in
                self?.didTapLogout()
            })
        ])
    }
    
}
//MARK:- UITableView Delegate and DataSource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // handle cell selection
        data[indexPath.section][indexPath.row].handler()
        
    }
}

