//
//  MenuRow.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct MenuRow : View {
    
    var item: MenuItem
    
    var body: some View {
        
        HStack {
            Image(systemName: "cloud.sun")
            VStack(alignment: .leading) {
                Text(item.title)
                Text(item.subtitle).font(.subheadline)
                    .color(.gray)
            }
        }
    }
}

#if DEBUG
struct MenuRow_Previews : PreviewProvider {
    static var previews: some View {
        MenuRow(item: MenuItem(id: "1", title: "Item 2", subtitle: "Fire"))
    }
}
#endif
