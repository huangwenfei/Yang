//
//  LayoutConstraintReMaker.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public final class LayoutConstraintReMaker: 
    LayoutConstraintProtocol,
    LayoutBuilderAnchors
{
    
    // MARK: Types
    public typealias Maker = LayoutConstraintReMaker
    
    public typealias PositionX = LayoutTargetPositionX<Maker>
    public typealias PositionY = LayoutTargetPositionY<Maker>
    public typealias PositionHorizontal = LayoutTargetPositionHorizontal<Maker>
    public typealias PositionVertical = LayoutTargetPositionVertical<Maker>
    public typealias PositionCenter = LayoutTargetPositionCenter<Maker>
    public typealias PositionEdge = LayoutTargetPositionEdge<Maker>
    public typealias Size = LayoutTargetSize<Maker>
    public typealias SizeList = LayoutTargetSizeList<Maker>
    
    // MARK: Properties
    internal var oldConstraint: LayoutConstraint
    public var constraint: LayoutConstraint
    
    // MARK: Init
    public init(constraint: LayoutConstraint) {
        self.constraint = constraint
        self.oldConstraint = constraint.copy()
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
            ("constraint", constraint)
        ]
    }
    
    // MARK: LayoutBuilderAnchors
    public func makeStartPointWithAnchor<Target>(_ anchor: LayoutAnchor) -> Target where Target : LayoutTargetProtocol {
        .init(maker: .init(constraint: constraint))
    }
    
}

public final class LayoutConstraintReMakerLinker:
    LayoutConstraintProtocol,
    LayoutBuilderAnchors
{
    
    // MARK: Types
    public typealias Maker = LayoutConstraintReMakerLinker
    
    public typealias PositionX = LayoutLinkerPositionX<Maker>
    public typealias PositionY = LayoutLinkerPositionY<Maker>
    public typealias PositionHorizontal = LayoutLinkerPositionHorizontal<Maker>
    public typealias PositionVertical = LayoutLinkerPositionVertical<Maker>
    public typealias PositionCenter = LayoutLinkerPositionCenter<Maker>
    public typealias PositionEdge = LayoutLinkerPositionEdge<Maker>
    public typealias Size = LayoutLinkerSize<Maker>
    public typealias SizeList = LayoutLinkerSizeList<Maker>
    
    // MARK: Properties
    internal var oldConstraint: LayoutConstraint
    public var constraint: LayoutConstraint
    
    // MARK: Init
    public init(constraint: LayoutConstraint) {
        self.constraint = constraint
        self.oldConstraint = constraint.copy()
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
            ("constraint", constraint)
        ]
    }
    
    // MARK: LayoutBuilderAnchors
    public func makeStartPointWithAnchor<Target>(_ anchor: LayoutAnchor) -> Target where Target : LayoutTargetProtocol {
        .init(maker: .init(constraint: constraint))
    }
    
}
