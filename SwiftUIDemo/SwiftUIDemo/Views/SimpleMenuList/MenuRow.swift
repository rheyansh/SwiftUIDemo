//
//  MenuRow.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct MenuRow: View {
    var item: MenuItem
    
    var body: some View {
        
        HStack {
            Image(systemName: "cloud.sun")
            VStack(alignment: .leading) {
                Text(item.title)
                Text(item.subtitle).font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
