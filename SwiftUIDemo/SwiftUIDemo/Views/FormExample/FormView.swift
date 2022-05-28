//
//  FormView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct FormView : View {
    
    var body: some View {
        
        NavigationView {
            List {
                
                Image("header")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                VStack(alignment: .leading) {
                    FormRow(label: "NAME", placeHolder: "Fill in the restaurant name")
                    FormRow(label: "TYPE", placeHolder: "Fill in the restaurant type")
                    FormRow(label: "ADDRESS", placeHolder: "Fill in the restaurant address")
                    FormRow(label: "PHONE", placeHolder: "Fill in the restaurant phone")
                    FormRow(label: "DESCRIPTION", placeHolder: "Fill in the restaurant description")
                    
                    RoundedButton().padding(.top, 20)
                    }
                    .padding(.top, 20)
                    .listRowInsets(EdgeInsets())
                }
                
                .navigationBarTitle(Text("New Restaurant"))
                .navigationBarItems(trailing:
                    Button(action: {
                        
                    }, label: {
                        Text("Cancel")
                    })
            )
        }
        
    }
}

struct RoundedButton : View {
    var body: some View {
        
        LargeButton(title: "Save",
                    backgroundColor: Color.red,
                    foregroundColor: Color.green) {
                                print("Hello World")
        }.padding(.vertical, 10.0)
            .padding(.horizontal, 50)
    }
}

#if DEBUG
struct FormView_Previews : PreviewProvider {
    static var previews: some View {
        //FormView()
        
        Group {
            //FormView()
            FormView().previewLayout(.fixed(width: 375, height: 1000))
            RoundedButton().previewLayout(.sizeThatFits)
        }
    }
}
#endif


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
            .font(Font.system(size: 19, weight: .semibold))
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
