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
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            HStack {
                Text("\(name)")
                    .font(.largeTitle)
                Image(systemName: "star.fill")
                    .font(.headline)
                    .foregroundColor(.yellow)
            }
            Text(headline)
                .font(.subheadline)
            Divider()
            Text(bio)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(50)
            Spacer()

            HStack {
                Text("Phone")
                Spacer()
                Text("98567487345").color(.gray)
            }.padding(.bottom, 5)
            
            HStack {
                Text("Email")
                Spacer()
                Text("test@mail.com").color(.gray)
            }.padding(.bottom, 5)
            
            HStack {
                Text("Address")
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Sarita Vihar").color(.gray)
                    Text("New Delhi, Delhi - 110044").color(.gray)
                }
            }.padding(.bottom, 5)
            
            Spacer()
        }.padding(40)
    }
}

#if DEBUG
struct TutorDetailView_Previews : PreviewProvider {
    static var previews: some View {
        TutorDetailView(name: "Simon Ng", headline: "Founder of AppCoda", bio: "Founder of AppCoda. Author of multiple iOS prgramming books including Beginning iOS 12 Programming with Swift and Intermediate iOS 12 Programming with Swift. iOS Developer and Blogger.")
    }
}
#endif
