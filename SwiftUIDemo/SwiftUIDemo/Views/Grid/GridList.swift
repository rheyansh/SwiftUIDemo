//
//  GridList.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 28/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct GridList: View {
    
    @State var items = [
        GridListItem(type: GridListType.listWithLazyVGrid),
        GridListItem(type: GridListType.complexGrid),
        GridListItem(type: GridListType.complexGrid2)
    ]
    
    var body: some View {
        
        return NavigationView {
            List(items) { item in
                if item.type == .listWithLazyVGrid {
                    NavigationLink(destination: ListWithLazyVGrid()) {
                        GridListRowView(item: item)
                    }
                } else if item.type == .complexGrid {
                    NavigationLink(destination: ComplexGridView()) {
                        GridListRowView(item: item)
                    }
                } else if item.type == .complexGrid2 {
                    NavigationLink(destination: ComplexGridView2()) {
                        GridListRowView(item: item)
                    }
                }
                }
            .navigationBarTitle(Text("Grid Demo"), displayMode: .inline)
        }
    }
}

struct GridListRowView: View {
    var item: GridListItem
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                Text(item.subtitle).font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

//https://www.appcoda.com/learnswiftui/swiftui-gridlayout.html
