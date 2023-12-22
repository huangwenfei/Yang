//
//  LayoutMaker.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutMakerProtocol:
    LayoutConstraintOffsetImpl,
    LayoutConstraintMultiplierImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl
{
    
}

public class LayoutMaker<Modifier: LayoutConstraintProtocol>:
    LayoutConstraintProtocol,
    LayoutConstraintActiveImpl
{
    // MARK: Types
    public typealias Modifier = Modifier
    
    // MARK: Properties
    public internal(set) var constraint: LayoutConstraint
    
    // MARK: Init
    required public init(constraint: LayoutConstraint) {
        self.constraint = constraint
    }
    
    // MARK: LayoutConstraintProtocol
    public func elements() -> [ReflectableElement] {
        [
            ("constraint", constraint)
        ]
    }
    
}

extension LayoutMaker: LayoutConstraintInternalProtocol {
    
    /// LayoutConstraintAnchorTarget -> LayoutConstraintItem List -> NSLayoutConstraint List
    internal func buildConstraints() {
        constraint.buildConstraints()
    }
    
    internal func removeConstraints() {
        constraint.removeConstraints()
    }
    
    internal func activeConstraints() {
        constraint.activeConstraints()
    }
    
    internal func deactiveConstraints() {
        constraint.deactiveConstraints()
    }
    
    internal func cacheConstraint() {
        constraint.cacheConstraint()
    }
    
    internal func cleanConstraint() {
        constraint.cleanConstraint()
    }
    
}

extension LayoutMaker {
    
    @discardableResult
    public func active() -> Modifier {
        _active()
        return .init(constraint: constraint)
    }
    
    @discardableResult
    public func deactive() -> Modifier {
        _deactive()
        return .init(constraint: constraint)
    }
    
}
