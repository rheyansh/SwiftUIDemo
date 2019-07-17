//
//  SearchRepositoryRequest.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation

struct SearchRepositoryRequest: APIRequestType {
    typealias Response = SearchRepositoryResponse
    
    var path: String { return "/search/repositories" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: "SwiftUI"),
            .init(name: "order", value: "desc")
        ]
    }
}
