//
//  SearchBookViewModel.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI
import Combine

//https://www.avanderlee.com/combine/passthroughsubject-currentvaluesubject-explained/

final class SearchBookViewModel: ObservableObject {
    var didChange = PassthroughSubject<SearchBookViewModel, Never>()
    
    @Published var searchText = "" {
        didSet { didChange.send(self) }
    }
    
    private (set) var items = [BookDisplayData]() {
        didSet { didChange.send(self) }
    }
    
    private (set) var itemImages = [String: UIImage]() {
        didSet { didChange.send(self) }
    }
    
    private var searchCancellable: Cancellable? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    deinit {
        searchCancellable?.cancel()
    }
    
    init () {
        print("Init ViewModel")
        //$0.$$searchText.value
//https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine
        searchCancellable = didChange.eraseToAnyPublisher()
            .map {
                $0.$searchText
        }
        .debounce(for: 0.5, scheduler: DispatchQueue.main)
//            .removeDuplicates()
//            .filter { !$0.isEmpty && $0.first != " " }
            .flatMap { (searchString) -> AnyPublisher<[Book], Never> in
                print("searchString: \(searchString)")
                return BookAPIService.searchBy(title: self.searchText)
                    .replaceError(with: []) //TODO: Handle Errors
                    .eraseToAnyPublisher()
        }
        .map {
            self.booksToBookDisplayData(books: $0)
        }
        .replaceError(with: []) //TODO: Handle Errors
            .assign(to: \.items, on: self)
         
    }
    
    private func booksToBookDisplayData(books: [Book]) -> [BookDisplayData]  {
        var displayDataItems = [BookDisplayData]()
        
        books.forEach {
            let displayData = BookDisplayData(id: $0.id, title: $0.volumeInfo?.title ?? "", authors: $0.volumeInfo?.authors ?? [], description: $0.volumeInfo?.description ?? "", thumbnail: $0.volumeInfo?.imageLinks?.thumbnail)
            displayDataItems.append(displayData)
        }
        return displayDataItems
    }
}
