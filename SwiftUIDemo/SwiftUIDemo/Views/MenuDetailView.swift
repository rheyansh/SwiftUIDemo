//
//  MenuDetailView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct MenuDetailView : View {
    var body: some View {
        VStack {
            /*MapView()
             .frame(height: 300)
             
             CircleImage()
             .offset(y: -130)
             .padding(.bottom, -130)*/
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack(alignment: .top) {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                }
                .padding()
            
            Spacer()
        }
    }
}

#if DEBUG
struct MenuDetailView_Previews : PreviewProvider {
    static var previews: some View {
        MenuDetailView()
    }
}
#endif
