//
//  SearchBookCell.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct SearchBookCell: View {
    private var displayData: BookDisplayData
    @State private var bookImage: UIImage? = nil
    private let placeholderImge = UIImage(named: "loadingbookFull")!
    
    //This way we can force injection and keep displayData private.
    init(displayData: BookDisplayData) {
        self.displayData = displayData
    }
    
    var body: some View {
        HStack {
            Image(uiImage: bookImage ?? placeholderImge)
                .resizable()
                .onAppear {
                    self.displayData.fetchImage { image in
                        self.bookImage = image
                    }
            }
            .frame(width: 50, height: 65)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(displayData.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                HStack {
                    Text("Authors:")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                    
                    ForEach(displayData.authors, id: \.self) {
                        Text($0)
                            .font(.footnote)
                    }
                }
            }
            
            Spacer()
        }
        .frame(height: 65)
    }
}

#if DEBUG
let bookDemoData = BookDisplayData(id: "1234", title: "Demo Book Demo Book Demo Book Demo Book Demo Book", authors: ["Author1","Author2"], description: "BookDescription", thumbnail: URL(string:"bookDemo")!)

struct SearchBookCell_Previews : PreviewProvider {
    static var previews: some View {
        SearchBookCell(displayData: bookDemoData)
            .previewLayout(.fixed(width: 300, height: 65))
            .previewDisplayName("SearchBookCell")
    }
}
#endif
