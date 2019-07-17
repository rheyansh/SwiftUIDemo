//
//  Book.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation

struct BookItem: Codable {
    let items: [Book]?
}

struct Book: Codable {
    let id: String
    let volumeInfo: VolumeInfo?
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let description: String?
    let imageLinks: ImageLinks?
    let industryIdentifiers: [[String:String]]?
}

struct ImageLinks: Codable {
    let thumbnail: URL?
}
