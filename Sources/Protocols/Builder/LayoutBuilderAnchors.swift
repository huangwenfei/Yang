//
//  LayoutBuilderAnchors.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutBuilderAnchors: LayoutAnchors where
    Self: LayoutBuilderPortocol
{
    func makeStartPointWithAnchor<Target>(_ anchor: LayoutAnchor) -> Target where Target: LayoutTargetProtocol
}

extension LayoutBuilderAnchors {
    
    internal func createMaker<Maker: LayoutConstraintProtocol>(by anchor: LayoutAnchor) -> Maker {
        .init(
            constraint: .init(
                target: .init(anchor: anchor, target: layoutItem),
                related: .none,
                formula: LayoutFormulaRelator.defaultFormula(using: .equal)
            )
        )
    }
    
}

extension LayoutBuilderAnchors {
    
    /// - Tag: Position
    public var left: PositionX {
        makeStartPointWithAnchor(.left)
    }
    
    public var right: PositionX {
        makeStartPointWithAnchor(.right)
    }
    
    public var top: PositionY {
        makeStartPointWithAnchor(.top)
    }
    
    public var bottom: PositionY {
        makeStartPointWithAnchor(.bottom)
    }
    
    public var leading: PositionX {
        makeStartPointWithAnchor(.leading)
    }
    
    public var trailing: PositionX {
        makeStartPointWithAnchor(.trailing)
    }
    
    public var centerX: PositionX {
        makeStartPointWithAnchor(.centerX)
    }
    
    public var centerY: PositionY {
        makeStartPointWithAnchor(.centerY)
    }
    
    public var horizontal: PositionHorizontal {
        makeStartPointWithAnchor(.horizontal)
    }
    
    public var diretionHorizontal: PositionHorizontal {
        makeStartPointWithAnchor(.diretionHorizontal)
    }
    
    public var vertical: PositionVertical {
        makeStartPointWithAnchor(.vertical)
    }
    
    public var diretionVertical: PositionVertical {
        makeStartPointWithAnchor(.diretionVertical)
    }
    
    public var edge: PositionEdge {
        makeStartPointWithAnchor(.edge)
    }
    
    public var diretionEdge: PositionEdge {
        makeStartPointWithAnchor(.diretionEdge)
    }
    
    public var center: PositionCenter {
        makeStartPointWithAnchor(.center)
    }
    
    /// - Tag: Size
    public var width: Size {
        makeStartPointWithAnchor(.width)
    }
    
    public var height: Size {
        makeStartPointWithAnchor(.height)
    }
    
    public var size: SizeList {
        makeStartPointWithAnchor(.size)
    }
    
    /// - Tag: Base Line
    public var lastBaseline: PositionY {
        makeStartPointWithAnchor(.lastBaseline)
    }
    
    public var firstBaseline: PositionY {
        makeStartPointWithAnchor(.firstBaseline)
    }
    
    /// - Tag: Margin
    public var leftMargin: PositionX {
        makeStartPointWithAnchor(.leftMargin)
    }
    
    public var rightMargin: PositionX {
        makeStartPointWithAnchor(.rightMargin)
    }
    
    public var topMargin: PositionY {
        makeStartPointWithAnchor(.topMargin)
    }
    
    public var bottomMargin: PositionY {
        makeStartPointWithAnchor(.bottomMargin)
    }

    public var leadingMargin: PositionX {
        makeStartPointWithAnchor(.leadingMargin)
    }
    
    public var trailingMargin: PositionX {
        makeStartPointWithAnchor(.trailingMargin)
    }

    public var centerXMargin: PositionX {
        makeStartPointWithAnchor(.centerXMargin)
    }
    
    public var centerYMargin: PositionY {
        makeStartPointWithAnchor(.centerYMargin)
    }
    
    public var horizontalMargins: PositionHorizontal {
        makeStartPointWithAnchor(.horizontalMargins)
    }
    
    public var diretionHorizontalMargins: PositionHorizontal {
        makeStartPointWithAnchor(.diretionHorizontalMargins)
    }
    
    public var verticalMargins: PositionVertical {
        makeStartPointWithAnchor(.verticalMargins)
    }
    
    public var diretionVerticalMargins: PositionVertical {
        makeStartPointWithAnchor(.diretionVerticalMargins)
    }
    
    public var centerMargins: PositionCenter {
        makeStartPointWithAnchor(.centerMargins)
    }
    
    public var edgeMargins: PositionEdge {
        makeStartPointWithAnchor(.edgeMargins)
    }
    
    public var diretionEdgeMargins: PositionEdge {
        makeStartPointWithAnchor(.diretionEdgeMargins)
    }
    
}
