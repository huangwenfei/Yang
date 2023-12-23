//
//  LayoutBatchTargetUpdater.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

public final class LayoutBatchTargetUpdater:
    LayoutBuilderAnchors
{
    
    // MARK: Types
    public typealias Maker = LayoutSimpleUpdater
    
    public typealias PositionX = LayoutLinkUpdateX<Maker>
    public typealias PositionY = LayoutLinkUpdateY<Maker>
    public typealias PositionHorizontal = LayoutLinkUpdateHorizontal<Maker>
    public typealias PositionVertical = LayoutLinkUpdateVertical<Maker>
    public typealias PositionCenter = LayoutLinkUpdateCenter<Maker>
    public typealias PositionEdge = LayoutLinkUpdateEdge<Maker>
    public typealias Size = LayoutLinkUpdateSize<Maker>
    public typealias SizeList = LayoutLinkUpdateSizeList<Maker>
    
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
