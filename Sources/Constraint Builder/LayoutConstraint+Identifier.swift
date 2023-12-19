//
//  LayoutConstraint+Identifier.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

extension LayoutConstraint: LayoutIdentifierParameter {
    
    @discardableResult
    public func identifier(_ value: LayoutIdentifierValue) -> LayoutConstraint {
        identifier = value.yangIdentifierValue
        return self
    }
    
}
