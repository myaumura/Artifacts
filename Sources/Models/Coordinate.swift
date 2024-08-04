//
//  File.swift
//  
//
//  Created by k.gusev on 01.08.2024.
//

import Foundation

public struct Coordinate: Codable {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        "{\"x\":\(x),\"y\":\(y)}"
    }
}
