//
//  LayoutConstraintModifierMaker.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public final class LayoutConstraintModifierMaker: 
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
    public typealias Maker = LayoutConstraintModifierMaker
    
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
    public private(set) var constraint: LayoutConstraint
    
    public var constraints: [LayoutConstraint]
    
    // MARK: Init
    public init(constraint: LayoutConstraint) {
        self.constraints = []
        self.constraint = constraint.copy()
    }
    
    public var layoutItem: LayoutItem {
        constraint.target.target!
    }
    
    public init(layoutItem: LayoutItem) {
        fatalError()
    }
    
    // MARK: LayoutConstraintProtocol
    public func elements() -> [ReflectableElement] {
        [
            ("oldConstraint", constraint),
            ("constraints", constraints)
        ]
    }
    
    // MARK: LayoutBuilderAnchors
    public func makeStartPointWithAnchor<Target>(_ anchor: LayoutAnchor) -> Target where Target : LayoutTargetProtocol {
        let maker: Target.Maker = createMaker(by: anchor)
        constraints.append(maker.constraint)
        return .init(maker: maker)
    }
    
}

extension LayoutConstraintModifierMaker {
    
    public func active() {
        diffUpdate(old: constraint)
        constraints.forEach({ $0.active() })
    }
    
    public func deactive() -> Void {
        constraints.forEach({ $0.deactive() })
    }
    
}
