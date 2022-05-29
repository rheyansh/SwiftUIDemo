//
//  LandingView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct LandingView : View {
    var body: some View {
        VStack {
            Image("header")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFill()
                .onTapGesture(count: 1, perform: {
                    print("11")
                })
                .clipShape(Circle())
            
                .overlay(
                    Circle().stroke(primaryColor, lineWidth: 4)
                ).padding(.bottom, 50)
                .shadow(radius: 10)
            
            NavigationLink(destination: LoginView()) {
                LoginButton()
            }
            Divider()
            
            Image("cafe-10")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFill()
                .onTapGesture(count: 1, perform: {
                    print("12")
                })
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(primaryColor, lineWidth: 4)
                ).padding(.top, 50)
                .shadow(radius: 10)
            
            NavigationLink(destination: RegisterView()) {
                RegisterButton()
            }
        }.padding()
    }
}

struct LoginButton: View {
    var body: some View {
        
        return HStack() {
            Text("Login")
        }.padding(.bottom, 20)
            .padding(.trailing, 20)
            .font(.custom("Avenir-Bold", size: 27))
    }
}

struct RegisterButton: View {
    var body: some View {
        
        return HStack() {
            Text("Register")
        }.padding(.bottom, 20)
            .padding(.trailing, 20)
            .font(.custom("Avenir-Bold", size: 27))
    }
}


#if DEBUG
struct LandingView_Previews : PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
#endif
