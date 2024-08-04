//
//  Move.swift
//
//
//  Created by k.gusev on 31.07.2024.
//

import Foundation
 
func move(x: Int, y: Int) throws {
   try post(endpoint: .action, action: .move, data: ["x": x, "y": y])
}
