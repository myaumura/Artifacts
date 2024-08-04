//
//  File.swift
//  
//
//  Created by k.gusev on 03.08.2024.
//

import Foundation

struct CharacterLog: Codable {
    let character: String
    let accound: String
    let type: String
    let description: String
    let content: String?
    let cooldown: Int
    let cooldownExpiration: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case character
        case accound
        case type
        case description
        case content
        case cooldown
        case cooldownExpiration = "cooldown_expiration"
        case createdAt = "created_at"
    }
}
