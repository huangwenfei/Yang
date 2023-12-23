//
//  LayoutBatchManager.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

public struct LayoutBatchManager:
    LayoutManager,
    LayoutManagerViewHierarchy,
    LayoutBuilderAnchors,
    LayoutManagerBuild,
    LayoutManagerBatchBuild
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
    
    public typealias TargetBuilder = LayoutBatchTargetBuilder
    public typealias LinkerBuilder = LayoutBatchLinkerBuilder
    
    public typealias Builder = LinkerBuilder
    
    // MARK: Properties
    private let oneself: LayoutItem
    
    public var layoutItem: LayoutItem { oneself }
    
    // MARK: Init
    public init(layoutItem oneself: LayoutItem) {
        self.oneself = oneself
    }
    
    // MARK: LayoutManager
    public func elements() -> [ReflectableElement] {
        [
            ("layoutItem", layoutItem)
        ]
    }
    
    // MARK: LayoutBuilderAnchors
    public func makeStartPointWithAnchor<Target>(_ anchor: LayoutAnchor) -> Target where Target : LayoutTargetProtocol {
        let maker: Target.Maker = createMaker(by: anchor)
        return .init(maker: maker)
    }
    
}
