//
//  HTTPMethods.swift
//
//
//  Created by k.gusev on 01.08.2024.
//

import Foundation

func getHTTP(url: String) throws {
    
    let semaphore = DispatchSemaphore(value: 0)
    
    guard let url = URL(string: url) else {
        fatalError("Error with getting url")
    }
    
    var request = URLRequest(url: url, timeoutInterval: 10)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
        guard let data = data, error == nil else {
            semaphore.signal()
            print(String(describing: error))
            return
        }
        
        do {
            let jsonData = try JSONDecoder().decode(String.self, from: data)
            print(jsonData)
            semaphore.signal()
        } catch {
            semaphore.signal()
            print(String(describing: error))
        }
    }
    task.resume()
}

func post(endpoint: Endpoint, action: Action, data: [String:Any]? = nil) throws {
    
    let server = "https://api.artifactsmmo.com"
    let url = server + endpoint.url + action.rawValue
    
    print(url)
    
    guard let url = URL(string: url) else {
        fatalError("Error with getting url")
    }
    
    var request = makeRequest(url: url, type: .post)
    
    if let data {
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        request.httpBody = jsonData
    }
    
    let semaphore = DispatchSemaphore(value: 0)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            semaphore.signal()
            return
        }
        
        if let response = response as? HTTPURLResponse, 300..<600 ~= response.statusCode {
            print("Error while re-auth, status code: \(response.statusCode)")
            semaphore.signal()
            return
        }
        
        guard let data = data else {
            print("No data received")
            semaphore.signal()
            return
        }
        
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            print("Response JSON: \(jsonResponse)")
        } catch {
            print("Failed to parse response JSON: \(error)")
        }
        semaphore.signal()
    }
    task.resume()
    semaphore.wait()
}
