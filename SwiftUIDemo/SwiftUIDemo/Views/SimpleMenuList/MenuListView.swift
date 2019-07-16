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
        MenuItem(id: "0", title: "Login", subtitle: "Form Example"),
        MenuItem(id: "1", title: "Item 2", subtitle: "Fire"),
        MenuItem(id: "2", title: "Item 3", subtitle: "Fire"),
        MenuItem(id: "3", title: "Item 4", subtitle: "Fire")
    ]
    
    var body: some View {
        
        /*List(items.identified(by: \.title)) { pokemon in
            HStack {
                Text(pokemon.title)
                Text(pokemon.subtitle).foregroundColor(.red)
            }
        }*/
       
        //return List(items, rowContent: MenuRow.init)

        /*return NavigationView {
            List(items, rowContent: MenuRow.init).navigationBarTitle(Text("Menu"))
                .navigationBarItems(
                    trailing: Button(action: addMenuItem, label: { Text("Add") })
            )
        }*/
        
        return NavigationView {
            List(items) { item in
                NavigationButton(destination: MenuDetailView(item: item)) {
                    MenuRow(item: item)
                }
                }.navigationBarTitle(Text("Menu"))
                .navigationBarItems(
                    trailing: Button(action: addMenuItem, label: { Text("Add") })
            )
        }
        
        /*NavigationView {
            List(items) { item in
                MenuRow(item: item)
    }.navigationBarTitle(Text("Menu"))
            .navigationBarItems(
                    trailing: Button(action: addMenuItem, label: { Text("Add") })
            )
            
        }*/
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
        if let randomPokemon = items.randomElement() {
            items.append(randomPokemon)
        }
    }
}

#if DEBUG
struct MenuListView_Previews : PreviewProvider {
    static var previews: some View {
       MenuListView() //MenuListView().previewDevice(PreviewDevice(rawValue: "iPhone XS"))
        
//        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
//            MenuListView()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//        }
    }
}
#endif







