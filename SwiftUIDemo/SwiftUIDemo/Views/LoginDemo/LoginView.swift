//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let storedUsername = "zzzzzzzz"
let storedPassword = "zzzzzzzz"


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
                UserImage()
                UsernameTextField(username: $username, editingMode: $editingMode)
                PasswordSecureField(password: $password, editingMode: $editingMode)
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
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(.basic(duration: 0.5, curve: .easeIn))
            }
        }
        .offset(y: editingMode ? -150 : 0)

    }
}

#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif

struct WelcomeText: View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        return
            Image("Sai Kambampati")
            .resizable()
            .aspectRatio(UIImage(named: "Sai Kambampati")!.size, contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct UsernameTextField : View {
    
    @Binding var username: String
    @Binding var editingMode: Bool

    var body: some View {
        return TextField($username, placeholder: Text("Username"), onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField : View {
    
    @Binding var password: String
    @Binding var editingMode: Bool

    var body: some View {
        return SecureField($password, placeholder: Text("Password"))
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        HStack {
            Text("Login")
                .font(.custom("Avenir-Medium", size: 20))
                .color(.black)
            Image(systemName: "cart")
                .foregroundColor(.black)
        }
        .frame(width: 220, height: 30)
            .padding()
            .background(Color.green)
            .cornerRadius(10.0)
    }
}

