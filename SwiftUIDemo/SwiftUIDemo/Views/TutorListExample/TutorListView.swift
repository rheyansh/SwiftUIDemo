//
//  TutorListView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 13/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct TutorListView : View {
    
    var tutors: [Tutor] = testData
    
    var body: some View {
        List(tutors) { tutor in
            TutorRowView(tutor: tutor)
        }.navigationBarTitle(Text("Tutors"), displayMode: .inline)
    }
}
