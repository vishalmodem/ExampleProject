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
}
struct Actor : Codable {
    let name : String?
    let image : String?
    
    }

