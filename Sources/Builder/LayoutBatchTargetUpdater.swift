//
//  LayoutBatchTargetUpdater.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

public final class LayoutBatchTargetUpdater:
    LayoutBuilder,
    LayoutBuilderAnchors
{
    
    // MARK: Types
    public typealias Maker = LayoutSimpleUpdater
    
    public typealias PositionX = LayoutTargetUpdateX<Maker>
    public typealias PositionY = LayoutTargetUpdateY<Maker>
    public typealias PositionHorizontal = LayoutTargetUpdateHorizontal<Maker>
    public typealias PositionVertical = LayoutTargetUpdateVertical<Maker>
    public typealias PositionCenter = LayoutTargetUpdateCenter<Maker>
    public typealias PositionEdge = LayoutTargetUpdateEdge<Maker>
    public typealias Size = LayoutTargetUpdateSize<Maker>
    public typealias SizeList = LayoutTargetUpdateSizeList<Maker>
    
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
