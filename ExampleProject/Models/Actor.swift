//
//  Actor.swift
//  ExampleProject
//
//  Created by vishal modem on 6/20/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import Foundation

struct Actors: Codable {
    var actors : [Actor]?
//    init(actors: [Actor]) {
//        self.actors = actors
//    }
}
struct Actor : Codable {
    let name : String?
    let image : String?
//    init(name:String, image : String) {
//        self.name = name
//        self.image = image
//    }
    
    }

