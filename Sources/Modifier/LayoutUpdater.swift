//
//  LayoutConstraintUpdater.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public final class LayoutUpdater:
    LayoutActivable,
    LayoutConstraintProtocol,
    LayoutUpdaterProtocol,
    LayoutConstraintActiveImpl,
    LayoutConstraintUpdateImpl
{
    
    // MARK: Types
    public typealias ContantReturn = LayoutUpdater
    public typealias PriorityReturn = LayoutUpdater
    public typealias IdentifierReturn = LayoutUpdater
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

extension LayoutUpdater {
    
    public func active() -> Void {
        updateIfCan()
        _active()
    }
    
}
