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
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Save")
                    .font(.headline)
                    .color(Color.white)
                Spacer()
            }
            }
            .padding(.vertical, 10.0)
            .background(Color.red, cornerRadius: 4.0)
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
