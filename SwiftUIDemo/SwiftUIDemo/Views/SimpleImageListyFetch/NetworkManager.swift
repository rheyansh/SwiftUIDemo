//
//  NetworkManager.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 18/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class NetworkManager: ObservableObject {
    
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    var courses = [Course]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let endPoint = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else { return }
        URLSession.shared.dataTask(with: endPoint) { (data, response, error) in
            
            guard let data = data else {
                print("No response data")
                return
            }
            do {
                
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.courses = courses
                }
                
            } catch let error {
                print("Json mapping error: \(error))")
            }
        }.resume()
    }
}
