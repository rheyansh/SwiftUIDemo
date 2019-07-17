//
//  FoodList.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct FoodList : View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: FoodDetailView(currentCategory: .burger)) {
                    CategoryView(imageName: "burger", categoryName: "BURGER")
                }
                NavigationLink(destination: FoodDetailView(currentCategory: .pizza)) {
                    CategoryView(imageName: "pizza", categoryName: "PIZZA")
                }
                NavigationLink(destination: FoodDetailView(currentCategory: .pasta)) {
                    CategoryView(imageName: "pasta", categoryName: "PASTA")
                }
                NavigationLink(destination: FoodDetailView(currentCategory: .dessert)) {
                    CategoryView(imageName: "cake", categoryName: "DESSERTS")
                }
            }
            .navigationBarTitle(Text("Food Delivery"))
        }
    }
}


#if DEBUG
struct FoodList_Previews : PreviewProvider {
    static var previews: some View {
        FoodList()
    }
}
#endif

struct CategoryView : View {
    
    var imageName: String
    var categoryName: String
    
    var body: some View {
        return ZStack {
            Image(imageName)
                //Enable size editing for the Image
                .resizable()
                //Define which method to use to keep the original dimensions when resizing
                .aspectRatio(UIImage(named: imageName)!.size, contentMode: .fill)
                //Declare the frame for your image
                .frame(width: 300, height: 150)
                //Cut out the exceeding parts of the image
                .clipped()
                .cornerRadius(20.0)
            Spacer()
            Text(categoryName)
                .font(.custom("HelveticaNeue-Medium", size: 50))
                .color(.white)
        }
        .padding(.top, 5)
            .padding(.bottom, 5)
    }
}
