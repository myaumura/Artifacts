//
//  Actions.swift
//
//
//  Created by k.gusev on 31.07.2024.
//

import Foundation
 
func move(x: Int, y: Int) throws {
   try post(endpoint: .action, action: .move, data: ["x": x, "y": y])
}

func fight() throws {
    try post(endpoint: .action, action: .fight)
}

func equipItem(slot: Slot, itemCode: String) throws {
    try post(endpoint: .action, action: .equip, data: ["code": itemCode, "slot": slot.rawValue])
}

func unequipItem(slot: Slot) throws {
    try post(endpoint: .action, action: .unequip, data: ["slot": slot.rawValue])
}

func gathering() throws {
    try post(endpoint: .action, action: .gathering)
}

func crafting(craftCode: String, quantity: Int) throws {
    try post(endpoint: .action, action: .crafting, data: ["code": craftCode, "quantity": quantity])
}

func deposit(itemCode: String, quantity: Int) throws {
    try post(endpoint: .action, action: .deposit, data: ["code": itemCode, "quantity": quantity])
}

func depositGold(quantity: Int) throws {
    try post(endpoint: .action, action: .depositGold, data: ["quantity": quantity])
}

