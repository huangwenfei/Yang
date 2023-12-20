//
//  LayoutConstraintMultiplier.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintMultiplierImpl: LayoutMultiplierParameter { }

extension LayoutConstraintMultiplierImpl where Self.MultiplierReturn == Void {
    
    public func multiplier(by value: LayoutMultiplierValue) {
        constraint.formula.multiplier = value
    }
    
    public func divided(by value: LayoutMultiplierValue) {
        constraint.formula.multiplier = (1.0 / value.yangMultiplierValue)
    }
    
}

extension LayoutConstraintMultiplierImpl where Self.MultiplierReturn == Self {
    
    @discardableResult
    public func multiplier(by value: LayoutMultiplierValue) -> Self {
        constraint.formula.multiplier = value
        return self
    }
    
    @discardableResult
    public func divided(by value: LayoutMultiplierValue) -> Self {
        constraint.formula.multiplier = (1.0 / value.yangMultiplierValue)
        return self
    }
    
}
