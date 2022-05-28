//
//  BulkDeleteListView.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 28/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct BulkDeleteListView: View {
    
    @State var bookTitles = [
        "Book 1",
        "Book 2",
        "Book 3",
        "Book 4",
        "Book 5",
        "Book 6"
    ]
    var body: some View {
        NavigationView {
                List {
                    ForEach (bookTitles, id: \.self) { title in
                        SwipeDeleteRowView(title: title)
                    }
                    .onDelete(perform: { indexSet in
                        deleteAction(indexSet)
                    })
                }
                .navigationTitle("My Books")
                .navigationBarItems(trailing: EditButton())
            }
    }
    
    func deleteAction(_ index: IndexSet) {
        bookTitles.remove(atOffsets: index)
    }
}

struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        BulkDeleteListView()
    }
}
