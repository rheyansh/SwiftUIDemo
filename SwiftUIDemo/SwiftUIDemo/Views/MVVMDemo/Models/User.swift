//
//  User.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Decodable, Hashable, Identifiable {
    var id: Int64
    var login: String
    var avatarUrl: URL
}
