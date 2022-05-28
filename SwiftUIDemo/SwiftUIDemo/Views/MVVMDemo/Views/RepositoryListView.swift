//
//  RepositoryListView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct RepositoryListView : View {
    @ObservedObject var viewModel: RepositoryListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.output.repositories) { repository in
                RepositoryListRow(repository: repository)
            }
            .alert(isPresented: $viewModel.isErrorShown) {
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
