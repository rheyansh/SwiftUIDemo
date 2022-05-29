//
//  EditProfileRowView.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 29/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct EditProfileRowView : View {
    var placeHolder: String
    var text: String

    var body: some View {
        
        VStack(alignment: .leading) {

            Text(placeHolder + ":")
                .font(.custom("Avenir-Medium", size: 17))
                .foregroundColor(darkGrayColor)
            TextField("", text: .constant(text))
                .padding()
                .background(lightGrayColor)
                .cornerRadius(5.0)
                .autocapitalization(.none)
    }
            .padding(.leading, 12)
            .padding(.trailing, 12)
}
}

struct DobRowView : View {
    var placeHolder: String
    var text: String

    var body: some View {
        
        VStack(alignment: .leading) {

            Text(placeHolder + ":")
                .font(.custom("Avenir-Medium", size: 17))
                .foregroundColor(darkGrayColor)
            DobButtonContent()
    }
            .padding(.leading, 12)
            .padding(.trailing, 12)
}
}

struct ProfessionRowView : View {
    var placeHolder: String
    var text: String

    var body: some View {
        
        VStack(alignment: .leading) {

            Text(placeHolder + ":")
                .font(.custom("Avenir-Medium", size: 17))
                .foregroundColor(darkGrayColor)
            ProfessionButtonContent()
    }
            .padding(.leading, 12)
            .padding(.trailing, 12)
}
}
struct DobButtonContent : View {
    @State var text: String = "Select"
    var body: some View {
        HStack {
            Text(text)
                .font(.custom("Avenir-Medium", size: 17))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "calendar")
                .foregroundColor(.black)
        }.onTapGesture(count: 1) {
            RPicker.selectDate { date in
                text = date.dateString()
            }
        }
        .padding()
        .background(lightGrayColor)
        .cornerRadius(5.0)
    }
}

struct ProfessionButtonContent : View {
    @State var text: String = "Select"
    var body: some View {
        HStack {
            Text(text)
                .font(.custom("Avenir-Medium", size: 17))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "calendar")
                .foregroundColor(.black)
        }.onTapGesture(count: 1) {
            RPicker.selectOption(dataArray: ["Student", "Salaried Employee", "Businessman", "Consultant", "Other"]) { value, atIndex in
                text = value
            }
        }
        .padding()
        .background(lightGrayColor)
        .cornerRadius(5.0)
    }
}

extension Date {
    
    func dateString(_ format: String = "dd MMM, YYYY") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    func dateByAddingYears(_ dYears: Int) -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.year = dYears
        
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
}
