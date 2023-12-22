//
//  LayoutReplacer.swift
//  Yang
//
//  Created by windy on 2023/12/22.
//

import Foundation

public class LayoutReplacer:
    LayoutTargetProtocol,
    LayoutConstraintProtocol,
    LayoutConstraintMultiplierImpl,
    LayoutConstraintOffsetImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl,
    LayoutConstraintActiveImpl
{
    
    public typealias Maker = LayoutReplacer
    
    public typealias MultiplierReturn = Maker
    public typealias ContantReturn = Maker
    public typealias PriorityReturn = Maker
    public typealias IdentifierReturn = Maker
    public typealias ActiveReturn = Void
    
    // MARK: Properties
    /// The Old One , Real Start Point
    private(set) var oldConstraint: LayoutConstraint
    /// Current Edit Constraint
    public private(set) var constraint: LayoutConstraint
    
    public var maker: Maker { self }
    
    public var layoutItem: LayoutItem {
        oldConstraint.target.target!
    }
    
    // MARK: Init
    required public init(constraint: LayoutConstraint) {
        self.oldConstraint = constraint.copy()
        self.constraint = constraint
    }
    
    required public init(maker: Maker) {
        fatalError()
    }
    
    public init(layoutItem: LayoutItem) {
        fatalError()
    }
    
    // MARK: LayoutConstraintProtocol
    public func elements() -> [ReflectableElement] {
        [
            ("oldConstraint", oldConstraint),
            ("constraint", constraint)
        ]
    }
    
}

extension LayoutReplacer {
    
    public func active() {
        diffUpdate(old: oldConstraint, new: constraint)
        constraint.active()
        oldConstraint = constraint.copy()
    }
    
    public func deactive() -> Void {
        [constraint, oldConstraint].forEach({ $0.deactive() })
    }
    
    internal func diffUpdate(old: LayoutConstraint, new: LayoutConstraint) {
        
        guard old.isActive else { return }
        
        var shouldReactive = false
        
        /// - Tag: Relate
        if new.related != old.related {
            old.deactive()
            shouldReactive = true
        }
        
        /// - Tag: Multiplier
        let newMultiplier = new.formula.multiplier.yangMultiplierValue
        let oldMultiplier = old.formula.multiplier.yangMultiplierValue
        if newMultiplier != oldMultiplier {
            old.deactive()
            shouldReactive = true
        }
        
        /// - Tag:  Identifier / Priority / Offset
        if shouldReactive == false {
            old.identifier = new.identifier
            old.formula.priority = new.formula.priority
            old.formula.constant = new.formula.constant
            
            old.updateIfCan()
        }
        
    }
    
}
