//
//  LayoutPriorityParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutPriorityParameter {
    
    func priority(_ value: LayoutPriorityValue) -> LayoutConstraint
    func priority(_ value: LayoutPriority) -> LayoutConstraint
    func priority(_ value: LayoutPriority.SystemType) -> LayoutConstraint
    
}
