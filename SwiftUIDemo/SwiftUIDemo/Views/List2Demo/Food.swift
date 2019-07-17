//
//  Food.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import SwiftUI

class Food: Identifiable {
    
    let title: String
    let price: Double
    let category: Categories
    let id: Int
    
    init(title: String, price: Double, category: Categories, id: Int) {
        self.title = title
        self.price = price
        self.category = category
        self.id = id
    }
}

#if DEBUG

let food = Food(title: "Margherita", price: 5.99, category: .pizza, id: 1)

let foodData: [Food] = [
    Food(title: "Margherita", price: 5.99, category: .pizza, id: 1),
    Food(title: "Prosciutto", price: 6.89, category: .pizza, id: 2),
    Food(title: "Funghi", price: 6.99, category: .pizza, id: 3),
    Food(title: "Calzone", price: 6.99, category: .pizza, id: 4),
    Food(title: "BBQ Burger", price: 9.90, category: .burger, id: 5),
    Food(title: "Cheeseburger", price: 7.90, category: .burger, id: 6),
    Food(title: "Vegan Burger", price: 8.90, category: .burger, id: 7),
    Food(title: "Pulled Pork Burger", price: 11.90, category: .burger, id: 8),
    Food(title: "Spagetthi Bolognese", price: 8.90, category: .pasta, id: 9),
    Food(title: "Penne all'arrabbiata", price: 7.90, category: .pasta, id: 10),
    Food(title: "Aglio e olio", price: 7.90, category: .pasta, id: 11),
    Food(title: "Cheesecake", price: 3.99, category: .dessert, id: 12),
    Food(title: "Cupcake", price: 2.99, category: .dessert, id: 13),
    Food(title: "Icecream", price: 2.99, category: .dessert, id: 14)
]

#endif
