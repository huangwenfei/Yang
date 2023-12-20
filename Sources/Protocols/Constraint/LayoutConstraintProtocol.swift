//
//  LayoutConstraintProtocol.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintProtocol: AnyObject, CustomReflectable {
    var constraint: LayoutConstraint { get }
    
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


internal protocol LayoutConstraintInternalProtocol {
    func buildConstraints()
    func activeConstraints()
    func deactiveConstraints()
    func removeConstraints()
    func cacheConstraint()
    func cleanConstraint()
}
