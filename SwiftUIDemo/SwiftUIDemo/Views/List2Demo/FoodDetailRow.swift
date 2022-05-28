//
//  FoodDetailRow.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct FoodDetailRow: View {
    
    var food: Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .padding(.top, 10)
                Text("\(food.price) $")
                    .font(.caption)
            }
            Spacer()
            Button(action: {print("Order received")}) {
                Text("ORDER")
                    .foregroundColor(.white)
            }
            .frame(width: 80, height: 50)
                .background(Color.orange)
                .cornerRadius(10.0)
        }
        .padding()
    }
}

#if DEBUG
struct FoodDetailRow_Previews : PreviewProvider {
    static var previews: some View {
        FoodDetailRow(food: food)
    }
}
#endif
