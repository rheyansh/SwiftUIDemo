//
//  GridListItem.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 28/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

enum GridListType {
    case unknown, listWithLazyVGrid, complexGrid, complexGrid2, dataStack
}

class GridListItem: Identifiable {
    var title: String = "Unknown"
    var subtitle: String = "Unknown"

    var type: GridListType
    
    init(type: GridListType) {
        self.type = type

        switch type {
        case .listWithLazyVGrid:
            self.title = "List Demo using LazyVGrid"
            self.subtitle = "list demo using LazyVGrid"

        case .complexGrid:
            self.title = "Complex Grid"
            self.subtitle = "combining more than one LazyVGrid"

        case .complexGrid2:
            self.title = "Another Complex Grid"
            self.subtitle = "cafe and coffee photos side by side, you can modify the gridLayout"

        case .dataStack:
            self.title = "Animated Data Stack View"
            self.subtitle = "animated data stack with bounce effect"

        case .unknown:
            self.title = "New Cell"
            self.subtitle = "New Cell"
        }
    }
}
