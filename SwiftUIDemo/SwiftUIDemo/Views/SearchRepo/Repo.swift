//
//  Repo.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import SwiftUI

struct Repo: Decodable, Identifiable {
    var id: Int
    let name: String
    let description: String
}

struct SearchResponse: Decodable {
    let items: [Repo]
}

let testRepo = Repo(id: 0, name: "RPicker", description: "Sai Kambampati is an app developer. He lives in Sacramento, CA and was awarded with Apple's WWDC 2017 Scholarship. Proficient in Swift and Python, it's his dream to develop an AI product.")
