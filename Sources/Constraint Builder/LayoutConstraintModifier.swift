//
//  LayoutConstraintModifier.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public final class LayoutConstraintModifier:
    LayoutActivable,
    LayoutConstraintProtocol,
    LayoutConstraintOffsetImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl,
    LayoutConstraintActiveImpl,
    LayoutConstraintUpdateImpl
{
    
    // MARK: Types
    public typealias ContantReturn = LayoutConstraintModifier
    public typealias MultiplierReturn = LayoutConstraintModifier
    public typealias PriorityReturn = LayoutConstraintModifier
    public typealias IdentifierReturn = LayoutConstraintModifier
    public typealias ActiveReturn = Void
    
    // MARK: Properties
    public internal(set) var constraint: LayoutConstraint
    
    public var isActive: Bool {
        constraint.isActive
    }
    
    // MARK: Init
    public init(constraint: LayoutConstraint) {
        self.constraint = constraint
    }
    
    // MARK: LayoutConstraintProtocol
    public func elements() -> [ReflectableElement] {
        [
            ("constraint", constraint)
        ]
    }
    
}
