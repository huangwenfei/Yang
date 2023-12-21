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
    
    public lazy private(set) var remake: LayoutConstraintReMaker = .init(
        constraint: constraint
    )
    
    public lazy private(set) var remakelink: LayoutConstraintReMaker = .init(
        constraint: constraint
    )
    
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
