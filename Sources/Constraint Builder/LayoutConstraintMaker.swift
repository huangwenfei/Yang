//
//  LayoutConstraintMaker.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public final class LayoutConstraintMaker: 
    LayoutConstraintProtocol,
    LayoutConstraintOffsetImpl,
    LayoutConstraintMultiplierImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl,
    LayoutConstraintActiveImpl
{
    
    // MARK: Types
    public typealias ContantReturn = LayoutConstraintMaker
    public typealias MultiplierReturn = LayoutConstraintMaker
    public typealias PriorityReturn = LayoutConstraintMaker
    public typealias IdentifierReturn = LayoutConstraintMaker
    public typealias ActiveReturn = LayoutConstraintModifier
    
    // MARK: Properties
    public internal(set) var constraint: LayoutConstraint
    
    internal var anchor: LayoutAnchor { constraint.target.anchor }
    internal var target: LayoutItem? { constraint.target.target }
    
    internal var related: LayoutConstraintAnchorTarget {
        get { constraint.related }
        set { constraint.related = newValue }
    }
    
    internal var formula: LayoutFormula {
        get { constraint.formula }
        set { constraint.formula = newValue }
    }
    
    internal var constraints: [LayoutTypes.LayoutConstraintTarget] {
        get { constraint.constraints }
        set { constraint.constraints = newValue }
    }
    
    // MARK: Init
    public init(constraint: LayoutConstraint) {
        self.constraint = constraint
        self.constraint.maker = self
    }
    
    // MARK: LayoutConstraintProtocol
    public func elements() -> [ReflectableElement] {
        [
            ("constraint", constraint)
        ]
    }
    
}

extension LayoutConstraintMaker: LayoutConstraintInternalProtocol {
    
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

extension LayoutConstraintMaker {
    
    @discardableResult
    public func active() -> LayoutConstraintModifier {
        _active()
        return .init(constraint: constraint)
    }
    
    @discardableResult
    public func deactive() -> LayoutConstraintModifier {
        _deactive()
        return .init(constraint: constraint)
    }
    
}
