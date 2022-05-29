//
//  SearchBookBar.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct SearchBookBar : View {
    @Binding var text: String
    
    var body: some View {
        ZStack {
            Color(red: 218/255.0, green: 218/255.0, blue: 218/255.0, opacity: 1.0)
            HStack {
                TextField("type a book name...", text: $text)
                    .padding([.leading, .trailing], 8)
                    .frame(height: 40)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
            }
            .padding([.leading, .trailing], 16)
        }
        .frame(height: 64)
    }
    
}

#if DEBUG
struct SearchBookBar_Previews : PreviewProvider {
    static var previews: some View {
        SearchBookBar(text: .constant(""))
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
#endif
