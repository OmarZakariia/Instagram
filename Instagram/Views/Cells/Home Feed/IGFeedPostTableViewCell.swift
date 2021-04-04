//
//  IGPostTableViewCell.swift
//  Instagram
//
//  Created by Omar Zakaria on /44/21.
//

import UIKit

final  class IGFeedPostTableViewCell: UITableViewCell {

    //MARK:- Variables and Constants
    static let identifier = "IGFeedPostTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Functions
    public func configure(){
        // configure the cell
    }
}
