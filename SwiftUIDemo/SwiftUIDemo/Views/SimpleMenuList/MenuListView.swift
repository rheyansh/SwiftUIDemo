//
//  MenuListView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct MenuListView : View {
    
    @State var items = [
        MenuItem(type: MenuListType.login),
        MenuItem(type: MenuListType.tutorList),
        MenuItem(type: MenuListType.localSearchDemo),
        MenuItem(type: MenuListType.expandCollapse),
        MenuItem(type: MenuListType.simpleMenuList),
        MenuItem(type: MenuListType.groupedlist),
        MenuItem(type: MenuListType.swipeDeleteListView),
        MenuItem(type: MenuListType.bulkDeleteListView)
    ]
    
    var body: some View {
        
        return List(items) { item in
                if item.type == .expandCollapse {
                    NavigationLink(destination: ExpandCollapseView()) {
                        MenuRow(item: item)
                    }
                } else if item.type == .login {
                    NavigationLink(destination: LoginView()) {
                        MenuRow(item: item)
                    }
                } else if item.type == .tutorList {
                    NavigationLink(destination: TutorListView()) {
                        MenuRow(item: item)
                    }
                } else if item.type == .groupedlist {
                    NavigationLink(destination: GroupedListView()) {
                        MenuRow(item: item)
                    }
                } else if item.type == .simpleMenuList {
                    NavigationLink(destination: FoodList()) {
                        MenuRow(item: item)
                    }
                } else if item.type == .bulkDeleteListView {
                    NavigationLink(destination: BulkDeleteListView()) {
                        MenuRow(item: item)
                    }
                } else if item.type == .swipeDeleteListView {
                    NavigationLink(destination: SwipeDeleteListView()) {
                        MenuRow(item: item)
                    }
                }  else if item.type == .localSearchDemo {
                    let store = ReposStore(service: .init())
                    let view = SearchRepoView().environmentObject(store)

                    NavigationLink(destination: view) {
                        MenuRow(item: item)
                    }
                } else if item.type == .unknown {
                    MenuRow(item: item)
                }
                }
            .navigationBarTitle(Text("Menu"), displayMode: .inline)
                .navigationBarItems(
                    trailing: Button(action: addMenuItem, label: { Text("Add Row") })
            )
    }
    
    func delete(at offsets: IndexSet) {
        if let last = offsets.last {
            items.remove(at: last)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        // sort the indexes low to high
        let reversedSource = source.sorted()
        
        // then loop from the back to avoid reordering problems
        for index in reversedSource.reversed() {
            // for each item, remove it and insert it at the destination
            items.insert(items.remove(at: index), at: destination)
        }
    }
    
    func addMenuItem() {
        items.append(MenuItem(type: MenuListType.unknown))
    }
}








