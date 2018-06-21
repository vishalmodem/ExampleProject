//
//  ImageShowVC.swift
//  ExampleProject
//
//  Created by vishal modem on 6/20/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit

class ImageShowVC: UIViewController {

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
        
    }

    @IBAction func dismissClicked(_ sender: UIButton) {
        
    }
    
}
