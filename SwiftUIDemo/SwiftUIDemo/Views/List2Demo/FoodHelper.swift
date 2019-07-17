//
//  FoodHelper.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation

enum Categories {
    case burger
    case pasta
    case pizza
    case dessert
}

func filterData(by category: Categories) -> [Food] {
    let filteredArray = foodData.filter { $0.category == category}
    return filteredArray
}

func categoryString (for category: Categories) -> String {
    switch category {
    case .pizza:
        return "Pizza"
    case .burger:
        return "Burger"
    case .pasta:
        return "Pasta"
    case .dessert:
        return "Desserts"
    }
}
