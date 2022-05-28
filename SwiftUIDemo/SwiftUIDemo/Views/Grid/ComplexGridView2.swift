//
//  ComplexGridView2.swift
//  SwiftUIDemo
//
//  Created by Raj Sharma on 28/05/22.
//  Copyright © 2022 raj.sharma. All rights reserved.
//

import SwiftUI

struct ComplexGridView2: View {
    @State var gridLayout = [ GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {

                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(cafe.coffeePhotos) { photo in
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 50)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                        .animation(.easeIn, value: gridLayout.count)
                    }

                }
                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .navigationTitle("Coffee Feed")
        }
    }
}

struct ComplexGridView2_Previews: PreviewProvider {
    static var previews: some View {
        ComplexGridView2()
    }
}
