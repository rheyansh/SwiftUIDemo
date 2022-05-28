//
//  RepoViewModel.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation

class GithubService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func search(matching query: String, handler: @escaping (Result<[Repo], Error>) -> Void) {
        
        let testRepo1 = Repo(id: 1, name: "RPicker", description: "Elegant and Easy-to-Use Swift Date and Options Picker. Master branch has the latest code and compatible with Swift 5. Check other branches for various Swift versions")
        let testRepo2 = Repo(id: 2, name: "RFirebaseMessaging", description: "Project provides basic idea and approach for building small social media application using firebase and implementing chat using Firebase")
        let testRepo3 = Repo(id: 3, name: "RBiometric", description: "Elegant and Easy-to-Use library for iOS Biometric (TouchId and FaceId) authentication")
        let testRepo4 = Repo(id: 4, name: "RBeacon", description: "Sample project for turning android device into a Beacon device. App can work as both broadcaster and receiver.")
        let testRepo5 = Repo(id: 5, name: "RPdfGenerator:", description: "A sample project to generate PDF file from data using itextpdf/itext7 library")

        let mainList = [testRepo1, testRepo2, testRepo3, testRepo4, testRepo5]
        let filteredList = mainList.filter({ $0.name.localizedCaseInsensitiveContains(query) || $0.description.localizedCaseInsensitiveContains(query) })

        debugPrint("filteredList")
        debugPrint(filteredList)
        
        handler(.success(filteredList))
        return;
        guard
            var urlComponents = URLComponents(string: "https://api.github.com/search/repositories")
            else { preconditionFailure("Can't create url components...") }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        
        guard
            let url = urlComponents.url
            else { preconditionFailure("Can't create url from url components...") }
        
        session.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                handler(.failure(error))
            } else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode(SearchResponse.self, from: data)
                    handler(.success(response?.items ?? []))
                } catch {
                    handler(.failure(error))
                }
            }
            }.resume()
    }
}
