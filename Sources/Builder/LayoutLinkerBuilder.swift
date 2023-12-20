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
    public typealias PositionX = LayoutLinkerPositionX
    public typealias PositionY = LayoutLinkerPositionY
    public typealias PositionHorizontal = LayoutLinkerPositionHorizontal
    public typealias PositionVertical = LayoutLinkerPositionVertical
    public typealias PositionCenter = LayoutLinkerPositionCenter
    public typealias PositionEdge = LayoutLinkerPositionEdge
    public typealias Size = LayoutLinkerSize
    public typealias SizeList = LayoutLinkerSizeList
    
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
        let result = Target(anchor: anchor, target: oneself)
        constraints.append(result.constraint.constraint)
        return result
    }
    
}
