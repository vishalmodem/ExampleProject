//
//  Actor.swift
//  RequestManagerFramework
//
//  Created by vishal modem on 6/28/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import Foundation

public struct Actors: Codable {
    public var actors : [Actor]?
   
}
public struct Actor : Codable {
    public let name : String?
    public let image : String?
    
    
}
