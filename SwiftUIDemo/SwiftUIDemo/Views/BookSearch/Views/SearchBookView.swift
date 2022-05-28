//
//  SearchBookView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct SearchBookView : View {
    @ObservedObject private var viewModel = SearchBookViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBookBar(text: $viewModel.searchText)
                List(viewModel.items) { item in
                    NavigationLink(destination: BookDetail(displayData: item)) {
                        SearchBookCell(displayData: item)
                    }
                }
            }
            .navigationBarTitle(Text("Books Search"))
        }
    }
}

#if DEBUG
struct SearchBookView_Previews : PreviewProvider {
    static var previews: some View {
        SearchBookView()
    }
}
#endif
