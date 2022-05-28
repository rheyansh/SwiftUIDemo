//
//  MenuDetailView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct MenuDetailView : View {
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            /*MapView()
             .frame(height: 300)
             
             CircleImage()
             .offset(y: -130)
             .padding(.bottom, -130)*/
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                
                HStack(alignment: .top) {
                    Text(item.subtitle)
                        .font(.subheadline)
                    Spacer()
                    Text(item.title)
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
        MenuDetailView(item: MenuItem(type: .expandCollapse))
    }
}
#endif
