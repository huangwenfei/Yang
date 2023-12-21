//
//  LayoutTargetManager.swift
//  WakeUI
//
//  Created by windy on 2023/12/14.
//

import Foundation

public struct LayoutTargetManager:
    LayoutManager,
    LayoutManagerViewHierarchy,
    LayoutBuilderAnchors,
    LayoutManagerBuild
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
    
    public typealias Builder = LayoutTargetBuilder
    
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
    
//        container.yang.leading .= .parent
//        container.yang.trailing .= .parent
//        container.yang.top .= .parent
//        container.yang.bottom .= .parent
//
//        container.yang.leading .= .sibling(indicator.yang.bottom)
    
    /// anchor -> anchor / anchor -> target (view / guide) / anchor -> contant
    
    /// target -> relation -> builder item list -> nslayout constraints
    container.yang.leading
        .equal(to: indicator) /// indicator.yang.leading
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .identifier("container leading-(10)-indicator.leading constraints")
        .active() /// create real nslayout constraints
    
    container.yang.leading
        .equalToParent()
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.leading
        .equalToParent(.trailing) /// === .equal(to: parentView.yang.trailing)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.horizontal
        .equalToParent(.diretionHorizontal) /// === .equal(to: parentView.yang.diretionHorizontal)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.leading
        .equal(to: parentView) /// === .equalToParent()
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.trailing
        .equal(to: indicator.yang.right)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.top
        .equal(to: indicator.safeAreaLayoutGuide)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.edge
        .equal(to: indicator)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.edge
        .equal(to: indicator.yang.diretionEdge)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.height
        .equal(to: 44)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.height
        .equal(to: indicator.yang.width)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.height
        .equal(to: indicator.yang.height)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()
    
    container.yang.size
        .equal(to: indicator.yang.size)
        .offset(10)
        .multiplier(by: 0.2)
        .priority(.high)
        .active()

    /// builder ->
    ///      target 1 -> relation -> builder item list
    ///      target 2 -> relation -> builder item list
    ///   -> nslayout constraints
    container.yang.make { maker in
        maker.trailing
            .equal(to: indicator.yang.trailing)
            .offset(10)
            .multiplier(by: 0.2)
            .priority(.high)
    }
    
    container.yang.update { maker in }
    container.yang.remake { maker in }
    container.yang.remove()
    
}
#endif
