//
//  LayoutParentRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutParentAnchorRelation: LayoutTargetProtocol { }

extension LayoutParentAnchorRelation {
    
    internal var haveParent: Bool {
        LayoutRelationship.haveParent(target)
    }
    
    internal func isParent(_ rhs: LayoutItem) -> Bool {
        LayoutRelationship.isParent(oneself: target?.parent, parentIs: rhs)
    }
    
}

public protocol LayoutParentRelation: LayoutParentAnchorRelation {
    
    func equalToParent() -> Maker
    func greaterOrEqualToParent() -> Maker
    func lessOrEqualToParent() -> Maker
    
}

public protocol LayoutParentPositionXRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorPositionX) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> Maker
    
}

public protocol LayoutParentPositionYRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorPositionY) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> Maker
    
}

public protocol LayoutParentPositionHorizontalRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionHorizontal) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> Maker
    
}

public protocol LayoutParentPositionVerticalRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionVertical) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> Maker
    
}

public protocol LayoutParentPositionEdgeRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionEdge) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> Maker
    
}

public protocol LayoutParentPositionCenterRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionCenter) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> Maker
    
}

public protocol LayoutParentSizeRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorSize) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorSize) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorSize) -> Maker
    
}

public protocol LayoutParentSizeListRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorSizeList) -> Maker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> Maker
    func lessOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> Maker
    
}
