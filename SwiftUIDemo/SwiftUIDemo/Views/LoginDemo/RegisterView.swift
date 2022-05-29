//
//  RegisterView.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 29/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    var body: some View {
        
        List {
            
            RegisterProfileImage()
            
            VStack(alignment: .leading) {
                EditProfileRowView(placeHolder: "Full Name", text: "")
                EditProfileRowView(placeHolder: "Phone", text: "")
                DobRowView(placeHolder: "Date of Birth", text: "")
                ProfessionRowView(placeHolder: "Profession", text: "")
                EditProfileRowView(placeHolder: "Email", text: "")
                EditProfileRowView(placeHolder: "Address", text: "")
                
                RegisterUserButton().padding(.top, 20)
                }
                .padding(.top, 20)
                .listRowInsets(EdgeInsets())
            }
            
        .navigationBarTitle(Text("Register"), displayMode: .inline)
        
    }
}

struct RegisterProfileImage: View {
    @State var uiImage = UIImage(named: "header")
    
    var body: some View {
        
        return VStack {
            HStack {
                Spacer()
                Image(uiImage: uiImage!)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: CGFloat(160), height: CGFloat(160))
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                Spacer()
            }.onTapGesture(count: 1) {
                FKMediaPicker.mediaPicker.pickImageFromDevice { pickedImage in
                    
                    
                    if let pickedImage = pickedImage {
                        uiImage = pickedImage
                    }
                }
            }
        }
        .padding()
    }
}


struct RegisterUserButton : View {
    var body: some View {
        
        LargeButton(title: "Register",
                    backgroundColor: primaryColor,
                    foregroundColor: Color.white) {
                                print("On Register")
        }.padding(.vertical, 10.0)
            .padding(.horizontal, 50)
    }
}


