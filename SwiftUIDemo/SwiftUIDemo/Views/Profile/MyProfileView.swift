//
//  MyProfileView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 28/05/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct MyProfileView : View {
    var headline: String = "Senior Software Engineer"
    
    var body: some View {
        
        SmartScrollView {
            VStack {
                
                MyProfileImage()
                MyProfileName()
                Text(headline)
                    .font(.subheadline)
                Divider()
                MyProfileBio()
                Divider()

                MyProfilePhone()
                MyProfileEmail()
                MyProfileAddress()
                Spacer()
            }
            .background(GeometryReader {
                // calculate height by consumed background and store in
                // view preference
                Color.clear.preference(key: ViewHeightKey.self,
                    value: $0.frame(in: .local).size.height) })
        }
        .padding(16)
        
    }
}

struct MyProfileImage: View {
    var body: some View {
        return Image("raj_sharma")
            .resizable()
            .clipShape(Circle())
            .frame(width: 200, height: 200)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct MyProfileName: View {
    var name: String = "Raj Sharma"
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

struct MyProfilePhone: View {
    var body: some View {
        return HStack {
            Text("Phone")
                .font(.custom("Avenir-Medium", size: 15))
            Spacer()
            Text("9760740150").foregroundColor(.gray)
                .font(.custom("Avenir-Medium", size: 15))
        }.padding(.bottom, 5)
    }
}

struct MyProfileEmail: View {
    var body: some View {
        return HStack {
            Text("Email")
                .font(.custom("Avenir-Medium", size: 15))
            Spacer()
            Text("link.rajsharma@mail.com").foregroundColor(.gray)
                .font(.custom("Avenir-Medium", size: 15))
        }.padding(.bottom, 5)
    }
}

struct MyProfileAddress: View {
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

struct MyProfileBio: View {
    
    var bio: String = """

Roles and Responsibilities:

    1. Get the requirement and define the scope of work to done with estimation
    2. Involved in all the phases of iOS app development and pushing the tasks for completion for release
    3. App store submission and checks the developed requirement meeting with the Apple guideline and principles
    4. Incidence handling and provide its resolution
    5. Work closely with back team for api refinement and external team for mobile app support
    6. Team code review and technical interview support
--------------------------------------------------------------------
Skills:

    1. Swift, SwiftUI, Objective C, Web Services, APNS, Agile Methodology
    2. Design Patterns (MVC, MVVM, VIPER), Core Data, Sqlite
    3. App Deployment & Distribution, Unit Test Cases, Version Control System, Continuous Integration
    4. AWS Lex Chatbots, Google Dialogflow based Chatbots, Cloud Databases (Firebase and Parse), WatchOS, iWatch App Development etc.
"""
    
    var body: some View {
        return Text(bio)
            .font(.custom("Avenir-Medium", size: 15))
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
    }
}

private struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

struct SmartScrollView<Content: View>: View {
    @State private var fitInScreen = false
    @State var axes = Axis.Set.vertical
    
    let content: () -> Content
    
    var body: some View {
        GeometryReader { gp in
            ScrollView(axes) {
                content()
                    .onAppear {
                        axes = fitInScreen ? [] : .vertical
                    }
                    
                .background(GeometryReader {
                    // calculate height by consumed background and store in
                    // view preference
                    Color.clear.preference(key: ViewHeightKey.self,
                        value: $0.frame(in: .local).size.height) })
                
            }
            .onPreferenceChange(ViewHeightKey.self) {
                 self.fitInScreen = $0 < gp.size.height    // << here !!
            }
            
           
        }
        
    }
    
}
