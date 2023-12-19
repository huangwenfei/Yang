//
//  LayoutConstraint+Priority.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

extension LayoutConstraint: LayoutPriorityParameter {
    
    @discardableResult
    public func priority(_ value: LayoutPriorityValue) -> LayoutConstraint {
        formula.priority = value
        return self
    }
    
    @discardableResult
    public func priority(_ value: LayoutPriority) -> LayoutConstraint {
        formula.priority = value
        return self
    }
    
    @discardableResult
    public func priority(_ value: LayoutPriority.SystemType) -> LayoutConstraint {
        formula.priority = value
        return self
    }
    
}
