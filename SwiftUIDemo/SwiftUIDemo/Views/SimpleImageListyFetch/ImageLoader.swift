//
//  ImageLoader.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 18/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            print("Invalid url")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    self.data = data
                }
            } else {
                print("No image data")
            }
        }.resume()
    }
}


