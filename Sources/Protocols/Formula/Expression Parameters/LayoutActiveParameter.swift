//
//  LayoutActiveParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/17.
//

import Foundation

public protocol LayoutActiveParameter {
    
    func active() -> LayoutConstraint
    func deactive() -> LayoutConstraint
    
}
