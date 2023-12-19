//
//  LayoutPositionAnchor.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutPositionAnchor {
    
    /// - Tag: Types
    associatedtype PositionX: LayoutTargetProtocol
    associatedtype PositionY: LayoutTargetProtocol
    
    /// - Tag: Position
    var left: PositionX { get }
    var right: PositionX { get }
    var top: PositionY { get }
    var bottom: PositionY { get }
    
    var leading: PositionX { get }
    var trailing: PositionX { get }
    
    var centerX: PositionX { get }
    var centerY: PositionY { get }
    
    /// - Tag: Base Line
    var lastBaseline: PositionY { get }
    var firstBaseline: PositionY { get }
    
    /// - Tag: Margin
    var leftMargin: PositionX { get }
    var rightMargin: PositionX { get }
    var topMargin: PositionY { get }
    var bottomMargin: PositionY { get }

    var leadingMargin: PositionX { get }
    var trailingMargin: PositionX { get }

    var centerXMargin: PositionX { get }
    var centerYMargin: PositionY { get }
    
}
