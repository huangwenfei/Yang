//
//  LayoutBatchLinkerBuilder.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import UIKit

public final class LayoutBatchLinkerBuilder:
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
    
    public typealias PositionX = LayoutLinkerPositionX<MakerX>
    public typealias PositionY = LayoutLinkerPositionY<MakerY>
    public typealias PositionHorizontal = LayoutLinkerPositionHorizontal<MakerHorizontal>
    public typealias PositionVertical = LayoutLinkerPositionVertical<MakerVertical>
    public typealias PositionCenter = LayoutLinkerPositionCenter<MakerCenter>
    public typealias PositionEdge = LayoutLinkerPositionEdge<MakerEdge>
    public typealias Size = LayoutLinkerSize<MakerSize>
    public typealias SizeList = LayoutLinkerSizeList<MakerSizeList>
    
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
