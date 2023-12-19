//
//  LayoutPositionListAnchor.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutPositionHorizontalAnchor {
    
    /// - Tag: Types
    associatedtype PositionHorizontal: LayoutTargetProtocol
    
    /// - Tag: Position
    var horizontal: PositionHorizontal { get }
    var diretionHorizontal: PositionHorizontal { get }
    
    /// - Tag: Margin
    var horizontalMargins: PositionHorizontal { get }
    var diretionHorizontalMargins: PositionHorizontal { get }
    
}

public protocol LayoutPositionVerticalAnchor {
    
    /// - Tag: Types
    associatedtype PositionVertical: LayoutTargetProtocol
    
    /// - Tag: Position
    var vertical: PositionVertical { get }
    var diretionVertical: PositionVertical { get }
    
    /// - Tag: Margin
    var verticalMargins: PositionVertical { get }
    var diretionVerticalMargins: PositionVertical { get }
    
}

public protocol LayoutPositionEdgeAnchor {
    
    /// - Tag: Types
    associatedtype PositionEdge: LayoutTargetProtocol
    
    /// - Tag: Position
    var edge: PositionEdge { get }
    
    /// - Tag: Margin
    var edgeMargins: PositionEdge { get }
    
}

public protocol LayoutPositionCenterAnchor {
    
    /// - Tag: Types
    associatedtype PositionCenter: LayoutTargetProtocol
    
    /// - Tag: Position
    var center: PositionCenter { get }
    
    /// - Tag: Margin
    var centerMargins: PositionCenter { get }
    
}
