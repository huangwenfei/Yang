//
//  LayoutConstraintProtocol.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintProtocol: AnyObject, CustomReflectable {
    var constraint: LayoutConstraint { get }
    init(constraint: LayoutConstraint)
    
    typealias ReflectableElement = (label: String?, value: Any)
    func elements() -> [ReflectableElement]
}

extension LayoutConstraintProtocol {
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
}

extension LayoutConstraintProtocol where Self: LayoutConstraint {
    public var constraint: LayoutConstraint { self }
}


extension LayoutConstraintProtocol {
    
    internal var anchor: LayoutAnchor { 
        get { constraint.target.anchor }
        set { constraint.target.anchor = newValue }
    }
    
    internal var target: LayoutItem? {
        get { constraint.target.target }
        set { constraint.target.target = newValue }
    }
    
    internal var related: LayoutConstraintAnchorTarget {
        get { constraint.related }
        set { constraint.related = newValue }
    }
    
    internal var formula: LayoutFormula {
        get { constraint.formula }
        set { constraint.formula = newValue }
    }

}


public protocol LayoutOldConstraintProtocol where Self: LayoutConstraintProtocol {
    var oldConstraint: LayoutConstraint { get }
}


internal protocol LayoutConstraintInternalProtocol {
    func buildConstraints()
    func activeConstraints()
    func deactiveConstraints()
    func removeConstraints()
    func cacheConstraint()
    func cleanConstraint()
}

extension LayoutConstraintInternalProtocol where Self: LayoutConstraintProtocol {
    
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
