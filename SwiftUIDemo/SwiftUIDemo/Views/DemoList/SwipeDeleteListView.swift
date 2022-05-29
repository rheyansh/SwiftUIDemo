//
//  SwipeDeleteListView.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 28/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct SwipeDeleteListView: View {
    @State var bookTitles = [
            "Book 1",
            "Book 2",
            "Book 3",
            "Book 4",
            "Book 5",
            "Book 6"
        ]
        
        var body: some View {
            List {
                ForEach (bookTitles, id: \.self) { title in
                    SwipeDeleteRowView(title: title)
                }
                .onDelete(perform: { indexSet in
                    deleteAction(indexSet)
                })
            }
            .navigationBarTitle(Text("Swipe Delete"), displayMode: .inline)
        }
        
        func deleteAction(_ index: IndexSet) {
            bookTitles.remove(atOffsets: index)
        }
}

struct SwipeDeleteRowView: View {
    var title: String
    var body: some View {
        HStack {
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(.green)
            Text(title)
            
        }
    }
}
