//
//  FoodDetailView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct FoodDetailView : View {
    
    var currentCategory: Categories

    var body: some View {
        List(filterData(by: currentCategory)) { food in
            FoodDetailRow(food: food)
        }
        .navigationBarTitle(Text(categoryString(for: currentCategory)), displayMode: .inline)
    }
}

#if DEBUG
struct FoodDetailView_Previews : PreviewProvider {
    static var previews: some View {
        FoodDetailView(currentCategory: .burger)
    }
}
#endif
