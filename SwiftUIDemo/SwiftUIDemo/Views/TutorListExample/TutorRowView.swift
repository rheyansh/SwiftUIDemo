//
//  TutorRowView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 12/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct TutorRowView : View {
    let tutor: Tutor
    
    var body: some View {
        return NavigationLink(destination: TutorDetailView(name: tutor.name, headline: tutor.headline, bio: tutor.bio)) {
            Image(tutor.imageName)
                .cornerRadius(40)
            VStack(alignment: .leading) {
                Text(tutor.name)
                Text(tutor.headline)
                    .font(.subheadline)
                    .color(.gray)
            }
        }
    }
}

#if DEBUG
struct TutorRowView_Previews : PreviewProvider {
    static var previews: some View {
        TutorRowView(tutor: testTutor)
    }
}
#endif
