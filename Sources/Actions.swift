//
//  Actions.swift
//
//
//  Created by k.gusev on 04.08.2024.
//

import Foundation

enum Action: String {
    case move
    case equip
    case unequip
    case fight
    case gathering
    case crafting
    case deposit = "bank/deposit"
    case depositGold = "bank/deposit/gold"
    case recycling
    case withdraw = "bank/withdraw"
    case withdrawGold = "bank/withdraw/gold"
    case geBuy = "ge/buy"
    case geSell = "ge/sell"
    case acceptNewTask = "task/new"
    case completeTask = "task/complete"
    case exchangeTask = "task/exchange"
    case delete
}
