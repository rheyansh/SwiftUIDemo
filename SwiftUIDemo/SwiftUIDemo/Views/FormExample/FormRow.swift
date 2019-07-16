//
//  FormRow.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct FormRow : View {
    var label: String
    var placeHolder: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(.constant(""), placeholder: Text(placeHolder))
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), cornerRadius: 5.0)
            }
            .padding(.horizontal, 15)
    }
}

//#if DEBUG
//struct FormRow_Previews : PreviewProvider {
//    static var previews: some View {
//        FormRow()
//    }
//}
//#endif
