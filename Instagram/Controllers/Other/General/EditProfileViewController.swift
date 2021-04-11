//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import UIKit

struct EditProfileFormModel {
    let label : String
    let placeHolder: String
    var value : String? // holds the current value of the current field
}

final class  EditProfileViewController: UIViewController,  UITableViewDataSource {
    
    //MARK:- Variables and Constants
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
    
        
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        configureModels()
        
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            // assign frames
        tableView.frame = view.bounds
    }
    
    //MARK:- Functions for buttons interaction
    
    
    @objc private func didTapSave(){
        // Save info into the database
        dismiss(animated: true, completion: nil)
    }
    @objc private func didTapCancel(){
        dismiss(animated: true, completion: nil)
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
    @objc private func didTapProfilePhotoButton(){
        
    }
    
    //MARK:- Functions
    
    private func configureModels(){
        
        // first section is gonna have 4 fields. name, username, website, bio
        let section1Labels = ["Name", "Username", "Bio"]
        
        var section1 = [EditProfileFormModel]()
        
        for label in section1Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)...", value: nil)
            section1.append(model)
        }
        models.append(section1)
         
        // email, phone and gender
        
        let section2Labels = ["Email", "Phone", "Gender"]
        
        var section2 = [EditProfileFormModel]()
        
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)...", value: nil)
            section2.append(model)
        }
        models.append(section2)
    }
    //MARK:- UITableViewDataSource and Functions
    private func createTableHeaderView() -> UIView {
        // create a header as a uiview for the table
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral)
        // .integral rounds up to the nearest integer in case we are using a floating point
        let size = header.height / 1.5
        
        let profilePhotoButton = UIButton(frame: CGRect(
                                            x: (view.width - size)/2,
                                            y: (header.height - size)/2,
                                            width: size,
                                            height: size))
        
        
        header.addSubview(profilePhotoButton)
        // to make the button circular
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        profilePhotoButton.tintColor = .label
        profilePhotoButton.setImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        return header
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // to create my own custom cell
        guard section == 1 else {
            return nil
        }
        // second section, aka position 1
        return "Private Information "
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier,for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self

        
        return cell
    }
    
}

//MARK:- Extension For FormTableViewCellDelegate
extension EditProfileViewController: FormTableViewCellDelegate{
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel){
        // Update the model
        print(updatedModel.value ?? "nil")
        
    }
    
    
}
