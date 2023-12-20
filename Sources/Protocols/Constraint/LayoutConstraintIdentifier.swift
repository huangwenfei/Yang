//
//  LayoutConstraintIdentifier.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintIdentifierImpl: LayoutIdentifierParameter { }

extension LayoutConstraintIdentifierImpl where Self.IdentifierReturn == Void {
    
    public func identifier(_ value: LayoutIdentifierValue) {
        constraint.identifier = value.yangIdentifierValue
    }
    
}

extension LayoutConstraintIdentifierImpl where Self.IdentifierReturn == Self {
    
    @discardableResult
    public func identifier(_ value: LayoutIdentifierValue) -> Self {
        constraint.identifier = value.yangIdentifierValue
        return self
    }
    
}
