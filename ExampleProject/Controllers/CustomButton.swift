//
//  CustumButton.swift
//  ExampleProject
//
//  Created by vishal modem on 6/21/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable
    var radius : CGFloat = 10
    
    override func awakeFromNib() {
        self.layer.cornerRadius = radius
        self.titleLabel?.font = UIFont(name: "SFUIText-Regular", size: 16)
    }
    

}
