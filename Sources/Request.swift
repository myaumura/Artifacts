//
//  Request.swift
//  
//
//  Created by k.gusev on 04.08.2024.
//

import Foundation

func makeRequest(url: URL, type: RequestType) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = type.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
    return request
}

enum RequestType: String {
    case post = "POST"
    case get = "GET"
}
