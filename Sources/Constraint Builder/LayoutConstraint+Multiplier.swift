//
//  LayoutConstraint+Multiplier.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

extension LayoutConstraint: LayoutMultiplierParameter {
    
    @discardableResult
    public func multiplier(by value: LayoutMultiplierValue) -> LayoutConstraint {
        formula.multiplier = value
        return self
    }
    
    @discardableResult
    public func divided(by value: LayoutMultiplierValue) -> LayoutConstraint {
        formula.multiplier = (1.0 / value.yangMultiplierValue)
        return self
    }
    
}
