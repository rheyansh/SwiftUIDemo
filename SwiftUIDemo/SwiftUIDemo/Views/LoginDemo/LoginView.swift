//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

let lightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let darkGrayColor = Color(red: 44.0/255.0, green: 44.0/255.0, blue: 44.0/255.0, opacity: 1.0)
let primaryColor = Color(red: 51/255.0, green: 105/255.0, blue: 172/255.0, opacity: 1.0)

let storedUsername = "bruce"
let storedPassword = "11111111"

struct LoginView : View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    @State var editingMode: Bool = false

    var body: some View {
        
        ZStack {
            VStack {
                WelcomeText()
                LogoImage()
                UsernameTextField(username: $username, editingMode: $editingMode)
                PasswordSecureField(password: $password, editingMode: $editingMode)
                DemoCredentialText()
                ForgotPasswordButton()
                
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: {
                    
                    print("Button tapped")
                    if self.username == storedUsername && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false                    } else {
                        self.authenticationDidFail = true
                    }
                    
                }) {
                    LoginButtonContent()
                }
            }
            .padding()
            
            if authenticationDidSucceed {
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(primaryColor)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(.easeIn(duration: 0.5), value: 2)
            }
        }
        .offset(y: editingMode ? -150 : 0)

    }
}

struct WelcomeText: View {
    var body: some View {
        return Text("THINK")
            .font(.custom("Avenir-Medium", size: 27))
            .foregroundColor(darkGrayColor)
            .padding(.bottom, 20)
    }
}

struct DemoCredentialText: View {
    var body: some View {
        return HStack() {
            Text("Demo Credential: bruce/11111111")
                .font(.custom("Avenir-Medium", size: 12))
                .foregroundColor(darkGrayColor)
                .padding(.bottom, 4)
            Spacer()

        }.padding(.leading, 20)
    }
}

struct ForgotPasswordButton: View {
    var body: some View {
        
        return HStack() {
            Spacer()
            Button {
                debugPrint("Forgot Password Tapped")
            } label: {
                Text("Forgot Password")
            }
        }.padding(.bottom, 20)
            .padding(.trailing, 20)
    }
}



struct LogoImage: View {
    var body: some View {
        return
            Image("ibm_logo")
            .resizable()
            .aspectRatio(UIImage(named: "ibm_logo")!.size, contentMode: .fit)
            .frame(width: 320, height: 80)
            .clipped()
            //.cornerRadius(150)
            .padding(.bottom, 60)
    }
}

struct UsernameTextField : View {
    
    @Binding var username: String
    @Binding var editingMode: Bool
    
    
    var body: some View {
        return HStack {
            Image(systemName: "person")
                .foregroundColor(.secondary)
            TextField("Username", text: $username, onEditingChanged: {edit in
                if edit == true
                {self.editingMode = true}
                else
                {self.editingMode = false}
            }).autocapitalization(.none)
        }
        .padding()
        .background(lightGrayColor)
        .cornerRadius(5.0)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct PasswordSecureField : View {
    
    @Binding var password: String
    @Binding var editingMode: Bool
    
    var body: some View {
        return HStack {
            Image("icons8-key-50")
                .resizable()
                .frame(width: 16.0, height: 16.0)
                .foregroundColor(lightGrayColor)
            SecureField("Password", text: $password)
                .foregroundColor(Color.black)
                .autocapitalization(.none)
            
        }
        .padding()
        .background(lightGrayColor)
        .cornerRadius(5.0)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        HStack {
            Text("Login")
                .font(.custom("Avenir-Medium", size: 20))
                .foregroundColor(.white)
//            Image(systemName: "cart")
//                .foregroundColor(.black)
        }
        .frame(width: 220, height: 16)
            .padding()
            .background(primaryColor)
            .cornerRadius(10.0)
    }
}

