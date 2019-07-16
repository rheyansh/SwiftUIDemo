//
//  SearchRepoView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct SearchRepoView : View {
    
    @State private var query: String = "Swift"
    @EnvironmentObject var repoStore: ReposStore

    
    var body: some View {
        NavigationView {
            List {
                TextField($query, placeholder: Text("type something..."), onCommit: fetch)
                ForEach(repoStore.repos) { repo in
                    RepoRow(repo: repo)
                }
                }.navigationBarTitle(Text("Search"))
            }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        repoStore.fetch(matching: query)
    }
}

#if DEBUG
struct SearchRepoView_Previews : PreviewProvider {
    static var previews: some View {
        SearchRepoView().environmentObject(ReposStore(service: .init()))
    }
}
#endif
