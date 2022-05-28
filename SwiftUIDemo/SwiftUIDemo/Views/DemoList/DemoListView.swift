//
//  DemoListView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 28/05/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

enum DemoType {
    case groupedlist, expandCollapse, swipeDeleteListView, bulkDeleteListView
}

struct DemoListView: View {
    var typeArray = [
        DemoListItem(type: DemoType.expandCollapse),
        DemoListItem(type: DemoType.swipeDeleteListView),
        DemoListItem(type: DemoType.groupedlist),
        DemoListItem(type: DemoType.bulkDeleteListView)
    ]
    
    var body: some View {
        
        NavigationView {
            List(typeArray) { item in
                
                if item.type == .expandCollapse {
                    NavigationLink(destination: ExpandCollapseView()) {
                        DemoListRowView(item: item)
                    }
                } else if item.type == .groupedlist {
                    NavigationLink(destination: GroupedListView()) {
                        DemoListRowView(item: item)
                    }
                }else if item.type == .swipeDeleteListView {
                    NavigationLink(destination: SwipeDeleteListView()) {
                        SwipeDeleteListView(item: item)
                    }
                } else if item.type == .bulkDeleteListView {
                    NavigationLink(destination: BulkDeleteListView()) {
                        SwipeDeleteListView(item: item)
                    }
                }
            }
        }
    }
}

struct DemoListRowView: View {
    var item: DemoListItem
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(.green)
            Text(item.title)
        }
    }
}

class DemoListItem: Identifiable {
    let id = UUID()
    var title: String = "Unknown"
    
    var type: DemoType
    
    init(type: DemoType) {
        self.type = type
        
        switch type {
        case .expandCollapse: title = "ExpandCollapse List Example"
        case .groupedlist: title = "Grouped List Example"
        case .swipeDeleteListView: title = "Swipe Delete List Example"
        case .bulkDeleteListView: title = "Bulk Delete List Example"

        }
    }
}
