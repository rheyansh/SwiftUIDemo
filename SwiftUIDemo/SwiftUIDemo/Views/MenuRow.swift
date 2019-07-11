//
//  MenuRow.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 10/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct MenuRow : View {
    
    var menuItem: MenuItem? = nil
    
    var body: some View {
        Text("Hello World!")
    }
}

#if DEBUG
struct MenuRow_Previews : PreviewProvider {
    static var previews: some View {
        MenuRow()
    }
}
#endif
