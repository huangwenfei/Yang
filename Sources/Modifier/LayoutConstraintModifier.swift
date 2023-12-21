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
    LayoutConstraintActiveImpl
{
    
    // MARK: Types
    public typealias ActiveReturn = Void
    
    // MARK: Properties
    public internal(set) var constraint: LayoutConstraint
    
    public var isActive: Bool { constraint.isActive }
    
    // MARK: Properties.Modifier
    public lazy private(set) var updater: LayoutConstraintModifierUpdater = .init(
        constraint: constraint
    )
    
    public lazy private(set) var make: LayoutConstraintModifierMaker = .init(
        constraint: constraint
    )
    
    public lazy private(set) var makelink: LayoutConstraintModifierMaker = .init(
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
