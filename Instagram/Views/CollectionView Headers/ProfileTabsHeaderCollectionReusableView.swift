//
//  ProfileTabsHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Omar Zakaria on /94/21.
//

import UIKit

class ProfileTabsHeaderCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "ProfileTabsHeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
