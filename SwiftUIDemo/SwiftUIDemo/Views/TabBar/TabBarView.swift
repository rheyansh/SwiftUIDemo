//
//  TabBarView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 28/05/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

enum TabItems: Int {
    case dashboard, list, grid, settings
}

struct TabBarView : View {
    @State private var selectedTab = TabItems.dashboard.rawValue

    var body: some View {
        return TabView(selection: $selectedTab) {

            NavigationView() {
                //LoginView()
                DemoListView()

            }
            .tabItem {
                Image(systemName: "house.circle.fill")
                Text("Dashboard")
            }
            .tag(TabItems.dashboard.rawValue)
            
            NavigationView {
                FoodList()
            }
            .tabItem {
                Image(systemName: "bookmark.circle.fill")
                Text("List")
            }
            .tag(TabItems.list.rawValue)
            
            NavigationView {
                SearchBookView()
            }
            .tabItem {
                Image(systemName: "video.circle.fill")
                Text("Grid")
            }
            .tag(TabItems.grid.rawValue)
            
            NavigationView {
                MenuListView()
            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Settings")
            }
            .tag(TabItems.settings.rawValue)
            
            NavigationView {
                DemoListView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Settings")
            }
            .tag(TabItems.settings.rawValue)
        }
    }
}

#if DEBUG
struct TabBarView_Previews : PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
#endif

/*
 TabView {
     ...
 }
 .tabViewStyle(PageTabViewStyle())
 */
