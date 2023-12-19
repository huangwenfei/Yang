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
    public typealias PositionX = LayoutTargetPositionX
    public typealias PositionY = LayoutTargetPositionY
    public typealias PositionHorizontal = LayoutTargetPositionHorizontal
    public typealias PositionVertical = LayoutTargetPositionVertical
    public typealias PositionCenter = LayoutTargetPositionCenter
    public typealias PositionEdge = LayoutTargetPositionEdge
    public typealias Size = LayoutTargetSize
    public typealias SizeList = LayoutTargetSizeList
    
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
        let result = Target(anchor: anchor, target: layoutItem)
        constraints.append(result.constraint)
        return result
    }
    
}
