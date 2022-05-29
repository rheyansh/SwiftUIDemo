//
//  MenuItem.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import UIKit
import SwiftUI

enum MenuListType {
    case unknown, login, groupedlist, expandCollapse, swipeDeleteListView, bulkDeleteListView, simpleMenuList, localSearchDemo, tutorList
}

class MenuItem: Identifiable {
    var title: String = "Unknown"
    var subtitle: String = "Unknown"
    
    var type: MenuListType
    
    init(type: MenuListType) {
        self.type = type
        
        switch type {
        case .login:
            self.title = "Login Demo"
            self.subtitle = "with validations"
            
        case .expandCollapse:
            self.title = "Expand and Collapse Demo"
            self.subtitle = "expand and collpase rows of list"
            
        case .groupedlist:
            
            self.title = "Grouped List Example"
            self.subtitle = "group rows into a sections"
            
        case .swipeDeleteListView:
            
            self.title = "Swipe Delete List Example"
            self.subtitle = "delete row on right to left swipe"
            
        case .bulkDeleteListView:
            
            self.title = "Bulk Delete List Example"
            self.subtitle = "delete multiple rows"
            
        case .simpleMenuList:
            self.title = "Simple List"
            self.subtitle = "with validations"
            
        case .localSearchDemo:
            self.title = "Local Search Demo"
            self.subtitle = "filter list based on local search"

        case .tutorList:
            self.title = "A Tutor List"
            self.subtitle = "attractive tutor list"

        case .unknown:
            self.title = "New Cell"
            self.subtitle = "New Cell"
        }    
    }
}
