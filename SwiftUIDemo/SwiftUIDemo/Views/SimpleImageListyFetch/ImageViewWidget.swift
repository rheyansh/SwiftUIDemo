//
//  ImageViewWidget.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 18/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import SwiftUI

struct ImageViewWidget : View {
    
    @ObservedObject var imageLoader:ImageLoader
    
    var body: some View {
        
        Image(uiImage: imageLoader.data.count == 0 ? UIImage(named: "burger")! : UIImage(data: imageLoader.data)!)
            .resizable()
        .aspectRatio(contentMode: .fit)
        
    }
    
    init(_ imageUrl: String) {
        imageLoader = ImageLoader(imageUrl)
    }
}

