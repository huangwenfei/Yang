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
    public typealias PositionX = LayoutTargetPositionX
    public typealias PositionY = LayoutTargetPositionY
    public typealias PositionHorizontal = LayoutTargetPositionHorizontal
    public typealias PositionVertical = LayoutTargetPositionVertical
    public typealias PositionCenter = LayoutTargetPositionCenter
    public typealias PositionEdge = LayoutTargetPositionEdge
    public typealias Size = LayoutTargetSize
    public typealias SizeList = LayoutTargetSizeList
    
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
    public typealias PositionX = LayoutLinkerPositionX
    public typealias PositionY = LayoutLinkerPositionY
    public typealias PositionHorizontal = LayoutLinkerPositionHorizontal
    public typealias PositionVertical = LayoutLinkerPositionVertical
    public typealias PositionCenter = LayoutLinkerPositionCenter
    public typealias PositionEdge = LayoutLinkerPositionEdge
    public typealias Size = LayoutLinkerSize
    public typealias SizeList = LayoutLinkerSizeList
    
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
