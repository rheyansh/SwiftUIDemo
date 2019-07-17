//
//  BookAPIService.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import Combine

enum BookAPIService {
    
    static private var baseURL: String {
        get {
            return "https://www.googleapis.com/books/v1/volumes?q="
        }
    }
    
    static func searchBy(title: String) -> AnyPublisher<[Book], Error> {
        guard let titleForSearch = title.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { fatalError("Cannot add %20 to search text") }
        let params = titleForSearch.appending("+intitle:").appending(titleForSearch).appending("&printType=books&maxResults=40")
        var request = URLRequest(url: (URL(string: baseURL + params))!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.send(request: request)
            .decode(type: BookItem.self, decoder: JSONDecoder())
            .tryMap {
                guard let books = $0.items else { throw RequestError.cannotParse }
                return books
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchImageData(imageUrl: URL) -> AnyPublisher<Data, Error> {
        let request = URLRequest(url: imageUrl)
        return URLSession.shared.send(request: request)
            .eraseToAnyPublisher()
    }
}
