//
//  Extensions.swift
//  Instagram
//
//  Created by Omar Zakaria on /313/21.
//

import UIKit

extension UIView{
    // get the width of any UIView frame
   
    public var width : CGFloat{
        return frame.size.width
    }
    
    public var height : CGFloat{
        return frame.size.height
    }
    
    public var top : CGFloat{
        return frame.origin.y
    }
    
    public var bottom : CGFloat{
        return frame.origin.y + frame.size.height
    }
    
    public var left : CGFloat{
        return frame.origin.x
    }
    
    public var right : CGFloat{
        return frame.origin.x + frame.size.width
    }
}
