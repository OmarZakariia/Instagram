//
//  PhotoCollectionViewCell.swift
//  Instagram
//
//  Created by Omar Zakaria on /94/21.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true // so nothing over flows
        accessibilityLabel = "User post image" // for the visually impaired
        accessibilityHint = "Double tap to open post" // this is what gets read out load
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: UserPost){
        let url = model.thumbnailImage
        // download the image
        photoImageView.sd_setImage(with: url, completed: nil)
        
            
        }
        
    
    public func configure(debug imageName: String){
        photoImageView.image = UIImage(named: imageName)
    }
}

