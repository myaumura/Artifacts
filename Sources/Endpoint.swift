//
//  Endpoint.swift
//
//
//  Created by k.gusev on 04.08.2024.
//

import Foundation

enum Endpoint {
    case action
    case logs
    case characters
    
    var url: String {
        switch self {
        case .action:
            "/my/\(username)/action/"
        case .logs:
            "/my/logs"
        case .characters:
            "/my/characters"
        }
    }
}
