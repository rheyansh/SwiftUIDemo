//
//  UnidirectionalDataFlowType.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 17/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    associatedtype OutputType
    
    func apply(_ input: InputType)
    var output: OutputType { get }
}

//https://www.hackingwithswift.com/example-code/language/what-is-a-protocol-associated-type
