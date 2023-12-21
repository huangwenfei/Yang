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
    
}


internal protocol LayoutConstraintInternalProtocol {
    func buildConstraints()
    func activeConstraints()
    func deactiveConstraints()
    func removeConstraints()
    func cacheConstraint()
    func cleanConstraint()
}
