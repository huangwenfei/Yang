//
//  LayoutTargetLinkerManager.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

public struct LayoutTargetLinkerManager:
    LayoutManager,
    LayoutManagerViewHierarchy,
    LayoutBuilderAnchors,
    LayoutManagerBuild
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
    
    public typealias Builder = LayoutLinkerBuilder
    
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

#if DEBUG && false
import UIKit

/// user case
private func testing() {
    let parentView = UIView()
    
    let container = UIView()
    let indicator = UIView()
    
    parentView.yang.addChild(container)
    parentView.yang.addChild(indicator)
    
    container.yanglink.left.trailing.equal(to: indicator).active()
    
    /// builder ->
    ///      target 1 -> relation -> builder item list
    ///      target 2 -> relation -> builder item list
    ///   -> nslayout constraints
    container.yanglink.make { maker in
        maker.trailing.left
            .equal(to: indicator.yang.trailing)
            .offset(10)
            .multiplier(by: 0.2)
            .priority(.high)
    }
    
    container.yanglink.update { maker in }
    container.yanglink.remake { maker in }
    container.yanglink.remove()
    
}
#endif
