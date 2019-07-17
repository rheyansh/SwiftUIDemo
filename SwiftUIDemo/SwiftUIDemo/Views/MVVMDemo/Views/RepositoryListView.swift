//
//  RepositoryListView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct RepositoryListView : View {
    @ObjectBinding var viewModel: RepositoryListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.output.repositories) { repository in
                RepositoryListRow(repository: repository)
            }
            .presentation($viewModel.isErrorShown) { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.output.errorMessage))
            }
            .navigationBarTitle(Text("Repositories"))
        }
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

#if DEBUG
struct RepositoryListView_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryListView(viewModel: .init())
    }
}
#endif
