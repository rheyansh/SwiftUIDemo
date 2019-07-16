//
//  TutorDetailView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 13/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct TutorDetailView : View {
    var name: String
    var headline: String
    var bio: String
    
    var body: some View {
        VStack {
            Image(name)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.orange, lineWidth: 4)
                )
                .shadow(radius: 10)
            Text(name)
                .font(.title)
            Text(headline)
                .font(.subheadline)
            Divider()
            Text(bio)
                .font(.headline)
            .multilineTextAlignment(.center)
                .lineLimit(50)
            }.padding().navigationBarTitle(Text(name), displayMode: .inline)
    }
}

#if DEBUG
struct TutorDetailView_Previews : PreviewProvider {
    static var previews: some View {
        TutorDetailView(name: "Simon Ng", headline: "Founder of AppCoda", bio: "Founder of AppCoda. Author of multiple iOS prgramming books including Beginning iOS 12 Programming with Swift and Intermediate iOS 12 Programming with Swift. iOS Developer and Blogger.")
    }
}
#endif
