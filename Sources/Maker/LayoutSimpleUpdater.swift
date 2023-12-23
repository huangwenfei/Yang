//
//  LayoutSimpleUpdater.swift
//  Yang
//
//  Created by windy on 2023/12/22.
//

import Foundation

public class LayoutSimpleUpdater:
    LayoutConstraintProtocol,
    LayoutConstraintOffsetImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl
{
    
    // MARK: Types
    public typealias Maker = LayoutSimpleUpdater
    
    public typealias ContantReturn = Maker
    public typealias PriorityReturn = Maker
    public typealias IdentifierReturn = Maker
    
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
