//
//  ActorTableViewCell.swift
//  ExampleProject
//
//  Created by vishal modem on 6/21/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit
import RequestManagerFramework

class ActorTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewer: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateCell(actor:Actor){
        nameLbl.text = actor.name
        let url = URL(string: actor.image!)
        if let imageUrl = url {
            do {
                let data = try Data(contentsOf: imageUrl)
                self.imageViewer.image = UIImage(data: data)
            } catch{
                print(error.localizedDescription)
            }
    }
  
    }
}
