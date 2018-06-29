//
//  CustomButton.swift
//  CustomButtonFramework
//
//  Created by vishal modem on 6/28/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import Foundation

public class CustomButton: UIButton {
    public var radius : CGFloat = 10
     public var size: CGFloat = 16
   
    override public func awakeFromNib() {
        self.layer.cornerRadius = radius
        self.titleLabel?.font = UIFont(name: "SFUIText-Regular", size: size)
    }
    
    
}
