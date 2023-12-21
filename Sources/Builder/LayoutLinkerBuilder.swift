//
//  LayoutLinkerBuilder.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import UIKit

public final class LayoutLinkerBuilder:
    LayoutBuilder,
    LayoutBuilderAnchors,
    LayoutBuilderBuild
{
    
    // MARK: Types
    public typealias Maker = LayoutConstraintMaker
    
    public typealias PositionX = LayoutLinkerPositionX<Maker>
    public typealias PositionY = LayoutLinkerPositionY<Maker>
    public typealias PositionHorizontal = LayoutLinkerPositionHorizontal<Maker>
    public typealias PositionVertical = LayoutLinkerPositionVertical<Maker>
    public typealias PositionCenter = LayoutLinkerPositionCenter<Maker>
    public typealias PositionEdge = LayoutLinkerPositionEdge<Maker>
    public typealias Size = LayoutLinkerSize<Maker>
    public typealias SizeList = LayoutLinkerSizeList<Maker>
    
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
