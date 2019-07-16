//
//  ReposStore.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI
import Combine

class ReposStore: BindableObject {
    var repos: [Repo] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    var didChange = PassthroughSubject<ReposStore, Never>()
    
    let service: GithubService
    init(service: GithubService) {
        self.service = service
    }
    
    func fetch(matching query: String) {
        service.search(matching: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos): self?.repos = repos
                case .failure: self?.repos = []
                }
            }
        }
    }
}
