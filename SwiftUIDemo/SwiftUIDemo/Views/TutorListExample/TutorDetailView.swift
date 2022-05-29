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
        
        List {
            VStack {
                
                TutorDetailImage(name: name)
                TutorDetailName(name: name)
                Text(headline)
                    .font(.subheadline)
                Divider()
                TutorDetailBio(bio: bio)
                Divider()

                TutorDetailPhone()
                TutorDetailEmail()
                TutorDetailAddress()
                Spacer()
            }
        }
        .padding(16)
        .navigationBarTitle(Text(name), displayMode: .inline)
    }
}

struct TutorDetailImage: View {
    var name: String
    var body: some View {
        return Image(name)
            .resizable()
            .clipShape(Circle())
            .frame(width: 160, height: 160)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct TutorDetailName: View {
    var name: String
    var body: some View {
        return HStack {
            Text("\(name)")
                .font(.custom("Avenir-Medium", size: 24))
            Image(systemName: "star.fill")
                .font(.headline)
                .foregroundColor(.yellow)
        }
    }
}

struct TutorDetailPhone: View {
    var body: some View {
        return HStack {
            Text("Phone")
                .font(.custom("Avenir-Medium", size: 15))
            Spacer()
            Text("9876543210").foregroundColor(.gray)
                .font(.custom("Avenir-Medium", size: 15))
        }.padding(.bottom, 5)
    }
}

struct TutorDetailEmail: View {
    var body: some View {
        return HStack {
            Text("Email")
                .font(.custom("Avenir-Medium", size: 15))
            Spacer()
            Text("dummy@mail.com").foregroundColor(.gray)
                .font(.custom("Avenir-Medium", size: 15))
        }.padding(.bottom, 5)
    }
}

struct TutorDetailAddress: View {
    var body: some View {
        return HStack {
            Text("Address")
                .font(.custom("Avenir-Medium", size: 15))
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Sarita Vihar").foregroundColor(.gray)
                    .font(.custom("Avenir-Medium", size: 15))
                Text("New Delhi, Delhi - 110044").foregroundColor(.gray)
                    .font(.custom("Avenir-Medium", size: 15))
            }
        }.padding(.bottom, 5)
    }
}

struct TutorDetailBio: View {
    var bio: String
    var body: some View {
        return Text(bio)
            .font(.custom("Avenir-Medium", size: 15))
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
    }
}

