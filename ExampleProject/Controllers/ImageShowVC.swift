//
//  ImageShowVC.swift
//  ExampleProject
//
//  Created by vishal modem on 6/20/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit
import CustomButtonFramework

class ImageShowVC: UIViewController {

    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var image :UIImage?
    var name : String?{
        didSet{
            navigationItem.title = name
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let img = image else { return }
        imageView.image = img
        NameLbl.text = name
    }

    @IBAction func dismissClicked(_ sender: UIButton) {
        
    }
    
}
