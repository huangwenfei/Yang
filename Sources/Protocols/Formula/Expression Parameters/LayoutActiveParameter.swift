//
//  LayoutActiveParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/17.
//

import Foundation

public protocol LayoutActiveParameter: LayoutConstraintProtocol {
    
    associatedtype ActiveReturn
    
    func active() -> ActiveReturn
    func deactive() -> ActiveReturn
    
}
