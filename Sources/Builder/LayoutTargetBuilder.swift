//
//  LayoutTargetBuilder.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import UIKit

public final class LayoutTargetBuilder: 
    LayoutBuilder, 
    LayoutBuilderAnchors,
    LayoutBuilderBuild
{

    // MARK: Types
    public typealias Maker = LayoutConstraintMaker
    
    public typealias PositionX = LayoutTargetPositionX<Maker>
    public typealias PositionY = LayoutTargetPositionY<Maker>
    public typealias PositionHorizontal = LayoutTargetPositionHorizontal<Maker>
    public typealias PositionVertical = LayoutTargetPositionVertical<Maker>
    public typealias PositionCenter = LayoutTargetPositionCenter<Maker>
    public typealias PositionEdge = LayoutTargetPositionEdge<Maker>
    public typealias Size = LayoutTargetSize<Maker>
    public typealias SizeList = LayoutTargetSizeList<Maker>
    
    // MARK: Properties
    private let oneself: LayoutItem
    
    public var layoutItem: LayoutItem { oneself }
    
    public var constraints: [LayoutConstraint] = []
    
    // MARK: Init
    public init(layoutItem oneself: LayoutItem) {
        self.oneself = oneself
    }
    
    // MARK: LayoutBuilder
    public func elements() -> [ReflectableElement] {
        [
            ("layoutItem", layoutItem),
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
