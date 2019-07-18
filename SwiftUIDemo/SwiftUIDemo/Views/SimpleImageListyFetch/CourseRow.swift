//
//  CourseRow.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 18/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct CourseRow : View {
    let course: Course
    
    var body: some View {
        
        VStack {
            ImageViewWidget(course.imageUrl)
            Text(course.name)
        }
    }
}

#if DEBUG
struct CourseRow_Previews : PreviewProvider {
    static var previews: some View {
        CourseRow(course: Course(id: 0, name: "Swift UI Tute", link: "", imageUrl: "", number_of_lessons: 46))
    }
}
#endif
