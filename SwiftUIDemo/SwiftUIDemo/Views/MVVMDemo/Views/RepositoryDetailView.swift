//
//  RepositoryDetailView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import SwiftUI

struct RepositoryDetailView: View {
    @ObservedObject var viewModel: RepositoryDetailViewModel
    
    var body: some View {
        Text(viewModel.repository.fullName)
    }
}

#if DEBUG
struct RepositoryDetailView_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(viewModel: .init(
            repository: Repository(id: 1, fullName: "foo", owner:
                User(id: 1, login: "bar", avatarUrl: URL(string: "http://baz.com")!))
            )
        )
    }
}
#endif
