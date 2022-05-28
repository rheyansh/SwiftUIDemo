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
            Image("Simon Ng")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFill()
                .onTapGesture(count: 1, perform: {
                    print("11")
                })
                .clipShape(Circle())
                
                .overlay(
Circle().stroke(Color.orange, lineWidth: 4)
                ).padding(.bottom, 50)
                .shadow(radius: 10)
            
            
            
            Divider()
            
            Image("Simon Ng")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFill()
                .onTapGesture(count: 1, perform: {
                    print("12")
                })
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.orange, lineWidth: 4)
                ).padding(.top, 50)
                .shadow(radius: 10)
            }.padding()
    }
}

#if DEBUG
struct LandingView_Previews : PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
#endif
