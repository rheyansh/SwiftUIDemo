//
//  RepoRow.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct RepoRow: View {
    let repo: Repo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .font(.headline)
            Text(repo.description)
                .font(.subheadline)
        }
    }
}

#if DEBUG
struct RepoRow_Previews : PreviewProvider {
    static var previews: some View {
        RepoRow(repo: testRepo)
    }
}
#endif
