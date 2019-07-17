//
//  TrackerService.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation

enum TrackEventType {
    case listView
}

protocol TrackerType {
    func log(type: TrackEventType)
}

final class TrackerService: TrackerType {
    
    func log(type: TrackEventType) {
        // do something
    }
}
