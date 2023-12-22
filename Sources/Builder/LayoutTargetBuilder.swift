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
    public typealias MakerX = LayoutMakerX
    public typealias MakerY = LayoutMakerY
    public typealias MakerCenter = LayoutMakerCenter
    public typealias MakerHorizontal = LayoutMakerHorizontal
    public typealias MakerVertical = LayoutMakerVertical
    public typealias MakerEdge = LayoutMakerEdge
    public typealias MakerSize = LayoutMakerSize
    public typealias MakerSizeList = LayoutMakerSizeList
    
    
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
