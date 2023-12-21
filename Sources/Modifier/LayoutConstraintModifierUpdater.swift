//
//  LayoutConstraintUpdater.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public final class LayoutConstraintModifierUpdater:
    LayoutActivable,
    LayoutConstraintProtocol,
    LayoutConstraintOffsetImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl,
    LayoutConstraintActiveImpl,
    LayoutConstraintUpdateImpl
{
    
    // MARK: Types
    public typealias ContantReturn = LayoutConstraintModifierUpdater
    public typealias PriorityReturn = LayoutConstraintModifierUpdater
    public typealias IdentifierReturn = LayoutConstraintModifierUpdater
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
