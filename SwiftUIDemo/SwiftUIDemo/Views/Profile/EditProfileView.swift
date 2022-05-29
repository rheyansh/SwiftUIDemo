//
//  EditProfileView.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 29/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct EditProfileView: View {
    
    var body: some View {
        
        List {
            
            EditProfileImage()
            
            VStack(alignment: .leading) {
                EditProfileRowView(placeHolder: "Full Name", text: "")
                EditProfileRowView(placeHolder: "Phone", text: "")
                DobRowView(placeHolder: "Date of Birth", text: "")
                ProfessionRowView(placeHolder: "Profession", text: "")
                EditProfileRowView(placeHolder: "Email", text: "")
                EditProfileRowView(placeHolder: "Address", text: "")
                
                RoundedButton().padding(.top, 20)
                }
                .padding(.top, 20)
                .listRowInsets(EdgeInsets())
            }
            
        .navigationBarTitle(Text("Edit Profile"), displayMode: .inline)
        
    }
}

struct EditProfileImage: View {
    @State var uiImage = UIImage(named: "raj_sharma")
    
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
            }
            ChangeImageButton().onTapGesture(count: 1) {
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

struct ChangeImageButton: View {
    var body: some View {
        
        return HStack() {
            Spacer()
            Button {

            } label: {
                Text("Update Image")
            }
            Spacer()
        }
    }
}

struct RoundedButton : View {
    var body: some View {
        
        LargeButton(title: "Save",
                    backgroundColor: primaryColor,
                    foregroundColor: Color.white) {
                                print("On Edit Profile Save")
        }.padding(.vertical, 10.0)
            .padding(.horizontal, 50)
    }
}

struct LargeButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 20
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let title: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.green,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        HStack {
            Spacer(minLength: LargeButton.buttonHorizontalMargins)
            Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(LargeButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled))
                .disabled(self.disabled)
            Spacer(minLength: LargeButton.buttonHorizontalMargins)
        }
        .frame(maxWidth:.infinity)
    }
}

struct LargeButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(currentForegroundColor, lineWidth: 1)
        )
            .padding([.top, .bottom], 10)
            .font(.custom("Avenir-Medium", size: 20))
    }
}
