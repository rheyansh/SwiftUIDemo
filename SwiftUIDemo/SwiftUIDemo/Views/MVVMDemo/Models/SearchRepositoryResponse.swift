//
//  SearchRepositoryResponse.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation

struct SearchRepositoryResponse: Decodable {
    var items: [Repository]
}
