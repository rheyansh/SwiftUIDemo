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
        
        NavigationView {
            List(items) { pokemon in
                HStack {
                    Text(pokemon.title)
                    Text(pokemon.subtitle).foregroundColor(.red)
                }
            }.navigationBarTitle(Text("Menu"))
            .navigationBarItems(
                    trailing: Button(action: addPokemon, label: { Text("Add") })
            )
            
        }
    }
    
    func addPokemon() {
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







