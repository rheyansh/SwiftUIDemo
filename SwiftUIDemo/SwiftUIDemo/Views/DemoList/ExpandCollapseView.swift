//
//  ExpandCollapseView.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 28/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct ExpandCollapseView: View {
    let authors = MockData.getAuthors()
    var body: some View {
        List(authors, children: \.subItems) { rowItem in
            ItemView(item: rowItem)
        }
        .navigationBarTitle(Text("Expand & Collapse"), displayMode: .inline)

    }
}

struct ItemView: View {
    var item: RowItem
    var isParent: Bool {
        return item.subItems != nil
    }
    var body: some View {
        HStack {
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(isParent ? .blue : .green)
            Text(item.title)
        }
    }
}

struct RowItem: Identifiable {
    let id = UUID()
    let title: String
    var subItems: [RowItem]? = nil
}

struct MockData {
    static func getAuthors() -> [RowItem] {
        let author1 = RowItem(title: "The Marvel Cinematic Universe", subItems: [
            RowItem(title: "Iron Man"),
            RowItem(title: "Thor"),
            RowItem(title: "Wanda Maximoff"),
            RowItem(title: "Natasha")
        ])
        
        let author2 = RowItem(title: "Extended Universe", subItems: [
            RowItem(title: "Batman"),
            RowItem(title: "Superman"),
        ])
        
        let author3 = RowItem(title: "Cartoon", subItems: [
            RowItem(title: "Duck Tales"),
            RowItem(title: "Teenage Mutant Ninja Turtles"),
            RowItem(title: "Samurai Jack"),
            RowItem(title: "Powerpuff Girls")
        ])
        
        return [author1, author2, author3]
    }
}
