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


let barBgColor = UIColor(red: 240/255.0, green: 243/255.0, blue: 244/255.0, alpha: 1)

struct TabBarView : View {
    @State private var selectedTab = TabItems.dashboard.rawValue

    init() {
        
        let tabBarAppeareance = UITabBarAppearance()
        tabBarAppeareance.shadowColor = .gray // For line separator of the tab bar
        
        UITabBar.appearance().backgroundColor = barBgColor
        UITabBar.appearance().barTintColor = UIColor(red: 51/255.0, green: 105/255.0, blue: 172/255.0, alpha: 1.0)
        UITabBar.appearance().standardAppearance = tabBarAppeareance
    }
    
    var body: some View {
        return TabView(selection: $selectedTab) {

            NavigationView() {
                LoginView()
            }
            .tabItem {
                Image(systemName: "house.circle.fill")
                Text("Dashboard")
            }
            .tag(TabItems.dashboard.rawValue)
            
            NavigationView {
                MenuListView()
                //FoodList()
            }
            .tabItem {
                Image(systemName: "doc.text.fill")
                Text("List")
            }
            .tag(TabItems.list.rawValue)

            NavigationView {
                //SearchBookView()
                //FormView()
                GridList()

                //ImagelistView()
                //LandingView()
                //DataStackView(deals: Deal.previewContent)
                //RepositoryListView(viewModel: .init())
            }
            .tabItem {
                Image(systemName: "video.circle.fill")
                Text("Grid")
            }
            .tag(TabItems.grid.rawValue)

            NavigationView {
                MyProfileView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
            .tag(TabItems.settings.rawValue)

            SettingNavView()
        }
    }
}

struct SettingNavView : View {
    
    var body: some View {
        return NavigationView {
            let store = SettingsStore()
            SettingsView().environmentObject(store)
        }
        .tabItem {
            Image(systemName: "list.dash")
            Text("Settings")
        }
        .tag(TabItems.settings.rawValue)
    }
}

/*
 TabView {
     ...
 }
 .tabViewStyle(PageTabViewStyle())
 */

