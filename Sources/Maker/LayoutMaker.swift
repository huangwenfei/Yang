//
//  LayoutMaker.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

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

extension LayoutMaker: LayoutConstraintInternalProtocol { }

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
