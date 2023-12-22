//
//  LayoutReMaker.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public final class LayoutReMaker: 
    LayoutBuilderConstraints,
    LayoutConstraintProtocol,
    LayoutBuilderAnchors,
    LayoutConstraintMultiplierImpl,
    LayoutConstraintOffsetImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl,
    LayoutConstraintActiveImpl
{
    // MARK: Types
    public typealias Maker = LayoutReMaker
    
    public typealias PositionX = LayoutTargetPositionX<Maker>
    public typealias PositionY = LayoutTargetPositionY<Maker>
    public typealias PositionHorizontal = LayoutTargetPositionHorizontal<Maker>
    public typealias PositionVertical = LayoutTargetPositionVertical<Maker>
    public typealias PositionCenter = LayoutTargetPositionCenter<Maker>
    public typealias PositionEdge = LayoutTargetPositionEdge<Maker>
    public typealias Size = LayoutTargetSize<Maker>
    public typealias SizeList = LayoutTargetSizeList<Maker>
    
    public typealias MultiplierReturn = Maker
    public typealias ContantReturn = Maker
    public typealias PriorityReturn = Maker
    public typealias IdentifierReturn = Maker
    public typealias ActiveReturn = Void
    
    // MARK: Properties
    /// The Old One , Real Start Point
    public private(set) var oldConstraint: LayoutConstraint
    /// Current Edit Constraint
    public private(set) var constraint: LayoutConstraint
    
    /// All Currents, New Create Constraints
    public var constraints: [LayoutConstraint]
    
    // MARK: Init
    public init(constraint: LayoutConstraint) {
        self.constraints = []
        self.oldConstraint = constraint.copy()
        self.constraint = oldConstraint
    }
    
    public var layoutItem: LayoutItem {
        oldConstraint.target.target!
    }
    
    public init(layoutItem: LayoutItem) {
        fatalError()
    }
    
    // MARK: LayoutConstraintProtocol
    public func elements() -> [ReflectableElement] {
        [
            ("oldConstraint", oldConstraint),
            ("constraint", constraint),
            ("constraints", constraints)
        ]
    }
    
    // MARK: LayoutBuilderAnchors
    public func makeStartPointWithAnchor<Target>(_ anchor: LayoutAnchor) -> Target where Target : LayoutTargetProtocol {
        constraint = LayoutConstraint(
            target: .init(anchor: anchor, target: layoutItem),
            related: .none,
            formula: LayoutFormulaRelator.defaultFormula(using: .equal)
        )
        constraints.append(constraint)
        return .init(maker: self as! Target.Maker)
    }
    
}

extension LayoutReMaker {
    
    public func active() {
        constraint = oldConstraint
        diffUpdate(old: constraint)
        constraints.forEach({ $0.active() })
    }
    
    public func deactive() -> Void {
        constraint = oldConstraint
        constraints.forEach({ $0.deactive() })
    }
    
}
