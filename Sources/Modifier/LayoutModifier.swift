//
//  LayoutModifier.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

#if false
// https://swiftsenpai.com/swift/understanding-some-and-any/
func modifierTest() {
    var modifier: any LayoutModifierProtocol = LayoutModifierX(constraint: .init(target: .none, related: .none, formula: .init(relation: .equal, multiplier: 1, constant: 0, priority: 1000)))
    modifier = LayoutModifierY(constraint: .init(target: .none, related: .none, formula: .init(relation: .equal, multiplier: 1, constant: 0, priority: 1000)))
}
#endif

public class LayoutModifier<Replacer: LayoutConstraintProtocol>:
    LayoutActivable,
    LayoutConstraintProtocol,
    LayoutModifierProtocol
{
    
    // MARK: Properties
    public internal(set) var constraint: LayoutConstraint
    
    public var isActive: Bool { constraint.isActive }
    
    // MARK: Properties.Modifier
    public lazy private(set) var updater: LayoutUpdater = .init(
        constraint: constraint
    )
    
    public lazy private(set) var replacer: Replacer = .init(
        constraint: constraint
    )
    
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
