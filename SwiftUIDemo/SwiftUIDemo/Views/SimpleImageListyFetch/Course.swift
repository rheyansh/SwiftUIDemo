//
//  Course.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 18/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import SwiftUI

struct Course: Decodable, Identifiable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let number_of_lessons: Int
}
