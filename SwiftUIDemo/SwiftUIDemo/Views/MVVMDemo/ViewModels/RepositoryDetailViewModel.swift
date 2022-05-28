//
//  RepositoryDetailViewModel.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class RepositoryDetailViewModel: ObservableObject {
    let didChange: AnyPublisher<RepositoryListViewModel, Never>
    let didChangeSubject = PassthroughSubject<RepositoryListViewModel, Never>()
    
    let repository: Repository
    
    init(repository: Repository) {
        didChange = AnyPublisher(didChangeSubject)
        self.repository = repository
    }
}
