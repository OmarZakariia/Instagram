//
//  FormTableViewCell.swift
//  Instagram
//
//  Created by Omar Zakaria on /94/21.
//

import UIKit

// To return the value to the view controller
protocol FormTableViewCellDelegate : AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel)
}

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let identifier = "FormTableViewCell"
    
    private var model : EditProfileFormModel?
    
    // weak var so I dont create a memory leak
    public weak var  delegate : FormTableViewCellDelegate?

    private let formLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        
        
        return label
    }()
    
    private let field : UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        
        field.delegate = self
        selectionStyle = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    //MARK:- Functions
    public func configure(with model: EditProfileFormModel){
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeHolder
        field.text = model.value
    }
    
    
     override func prepareForReuse() {
         super.prepareForReuse()
        if contentView.subviews.count > 0 {
            formLabel.removeFromSuperview()
            field.removeFromSuperview()
        }
         
     }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Assign frames
        formLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width/3,
                                 height: contentView.height)
        
        field.frame = CGRect(x: formLabel.right + 5,
                                 y: 0,
                                 width: contentView.width - 10 - formLabel.width,
                                 height: contentView.height)
    }
 
    
    //MARK:- Field
    // override text field delegate function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // every time the user taps the return button
        
        // get the latest value
        model?.value = textField.text
        
        guard let model = model else {
            
            return true
        }
        delegate?.formTableViewCell(self, didUpdateField: model)
        textField.resignFirstResponder() // to dismiss the keyboard when the user hits return
        return true
    }
   
    
}
