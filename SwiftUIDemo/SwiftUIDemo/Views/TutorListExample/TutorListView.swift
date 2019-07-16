//
//  TutorListView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 13/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct TutorListView : View {
    
    var tutors: [Tutor] = []
    
    var body: some View {
        NavigationView {
            List(tutors) { tutor in
                TutorRowView(tutor: tutor)
        }.navigationBarTitle(Text("Tutors"))
        }
    }
}

#if DEBUG
struct TutorListView_Previews : PreviewProvider {
    static var previews: some View {
        TutorListView(tutors: testData)
    }
}
#endif
