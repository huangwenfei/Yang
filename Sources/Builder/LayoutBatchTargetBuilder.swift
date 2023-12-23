//
//  LayoutBatchTargetBuilder.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import UIKit

public final class LayoutBatchTargetBuilder:
    LayoutBuilder,
    LayoutBuilderAnchors
{

    // MARK: Types
    public typealias MakerX = LayoutMakerVoidX
    public typealias MakerY = LayoutMakerVoidY
    public typealias MakerCenter = LayoutMakerVoidCenter
    public typealias MakerHorizontal = LayoutMakerVoidHorizontal
    public typealias MakerVertical = LayoutMakerVoidVertical
    public typealias MakerEdge = LayoutMakerVoidEdge
    public typealias MakerSize = LayoutMakerVoidSize
    public typealias MakerSizeList = LayoutMakerVoidSizeList
    
    public typealias PositionX = LayoutTargetPositionX<MakerX>
    public typealias PositionY = LayoutTargetPositionY<MakerY>
    public typealias PositionHorizontal = LayoutTargetPositionHorizontal<MakerHorizontal>
    public typealias PositionVertical = LayoutTargetPositionVertical<MakerVertical>
    public typealias PositionCenter = LayoutTargetPositionCenter<MakerCenter>
    public typealias PositionEdge = LayoutTargetPositionEdge<MakerEdge>
    public typealias Size = LayoutTargetSize<MakerSize>
    public typealias SizeList = LayoutTargetSizeList<MakerSizeList>
    
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
