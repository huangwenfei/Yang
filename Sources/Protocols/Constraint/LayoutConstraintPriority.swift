//
//  LayoutConstraintPriority.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintPriorityImpl: LayoutPriorityParameter { }

extension LayoutConstraintPriorityImpl where Self.PriorityReturn == Void {
    
    public func priority(_ value: LayoutPriorityValue) {
        constraint.formula.priority = value
    }
    
    public func priority(_ value: LayoutPriority) {
        constraint.formula.priority = value
    }
    
    public func priority(_ value: LayoutPriority.SystemType) {
        constraint.formula.priority = value
    }
    
}

extension LayoutConstraintPriorityImpl where Self.PriorityReturn == Self {
    
    @discardableResult
    public func priority(_ value: LayoutPriorityValue) -> Self {
        constraint.formula.priority = value
        return self
    }
    
    @discardableResult
    public func priority(_ value: LayoutPriority) -> Self {
        constraint.formula.priority = value
        return self
    }
    
    @discardableResult
    public func priority(_ value: LayoutPriority.SystemType) -> Self {
        constraint.formula.priority = value
        return self
    }
    
}
