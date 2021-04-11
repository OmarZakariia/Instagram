//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import UIKit

/// Profile View Controller 
final class ProfileViewController: UIViewController {

    //CollectionView
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureNavigationBar()
        
        
        let layout = UICollectionViewFlowLayout()
        // allows me to control things about how the collection view is laid out, like scroll directions and item size
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        let size = (view.width - 4 )/3
        layout.itemSize = CGSize(width: size, height:size)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.backgroundColor = .red
        
        // Cell
        collectionView?.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        // Headers (header per section)
        collectionView?.register(ProfileInfoHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier)
        
        collectionView?.register(ProfileTabsHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabsHeaderCollectionReusableView.identifier)
        
        
        
        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        collectionView?.frame = view.bounds // takes the entirety of the screen
    }
    
//MARK:- Functions
    private func configureNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingsButton))
    }
   
//MARK:- Functions for buttons interactions
    @objc private func didTapSettingsButton(){
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- UICollectionView Delegate and DataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if section == 0 {
            return 0
        }
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.configure(debug: "test")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // gets called when the user taps on an item on the cells
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            // footer
            return UICollectionReusableView()
        }
        
        if indexPath.section == 1 {
            // tabs header
            let tabControlHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileTabsHeaderCollectionReusableView.identifier, for: indexPath) as! ProfileTabsHeaderCollectionReusableView
            
            return tabControlHeader
        }
        
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier, for: indexPath) as! ProfileInfoHeaderCollectionReusableView
        
        return profileHeader
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.width, height: collectionView.height / 3)
        }
        // Size of section tabs
        return CGSize(width: collectionView.width, height: 65)
    }
}
