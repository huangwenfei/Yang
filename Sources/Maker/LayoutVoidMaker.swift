//
//  LayoutVoidMaker.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

public class LayoutVoidMaker:
    LayoutConstraintProtocol
{
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

extension LayoutVoidMaker: LayoutConstraintInternalProtocol { }
