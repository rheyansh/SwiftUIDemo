//
//  ImagelistView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 18/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct ImagelistView : View {
    
    @State var networkManager = NetworkManager()
    
    var body: some View {
        
        List(networkManager.courses, rowContent: CourseRow.init)
            .navigationBarTitle(Text("Image List"), displayMode: .inline)
    }
}

#if DEBUG
struct ImagelistView_Previews : PreviewProvider {
    static var previews: some View {
        ImagelistView()
    }
}
#endif
