//
//  SearchRepoView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct SearchRepoView : View {
    
    @State private var query: String = "R"

    @EnvironmentObject var repoStore: ReposStore
    
    var body: some View {
        NavigationView {
            List {
                TextField("type something", text: $query)
                            .onChange(of: query) { _ in
                                fetch()
                            }
                
//                List(repoStore.repos, id: \.id) { item in
//                    RepoRow(repo: item)
//                 }
                
                ForEach(repoStore.repos) { repo in
                    RepoRow(repo: repo)
                }
                }.navigationBarTitle(Text("Search"), displayMode: .inline)
            }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        repoStore.fetch(matching: query)
    }
}

