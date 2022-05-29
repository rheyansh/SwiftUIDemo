//
//  GroupedListView.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 28/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct GroupedListView: View {
    let foods = [
            "Burger",
            "Fried Chicken",
            "Salads"
        ]
        
        let drinks = [
            "Orange Juice",
            "Tea",
            "Coffee Latte",
            "Mineral water"
        ]
        var body: some View {
            List {
                Section(header: Text("Foods")) {
                    ForEach(foods, id: \.self) { item in
                        Text(item)
                    }
                }
                
                Section(header: Text("Beverages")) {
                    ForEach(drinks, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            .navigationBarTitle(Text("Section List"), displayMode: .inline)
            .listStyle(InsetGroupedListStyle())
        }
}
