//
//  LayoutParentRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutParentAnchorRelation { }

extension LayoutParentAnchorRelation where Self: LayoutTargetProtocol {
    
    internal var haveParent: Bool {
        LayoutRelationship.haveParent(target)
    }
    
    internal func isParent(_ rhs: LayoutItem) -> Bool {
        LayoutRelationship.isParent(oneself: target?.parent, parentIs: rhs)
    }
    
}

public protocol LayoutParentRelation: LayoutParentAnchorRelation {
    
    func equalToParent() -> LayoutConstraint
    func greaterOrEqualToParent() -> LayoutConstraint
    func lessOrEqualToParent() -> LayoutConstraint
    
}

public protocol LayoutParentPositionXRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraint
    
}

public protocol LayoutParentPositionYRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraint
    
}

public protocol LayoutParentPositionHorizontalRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraint
    
}

public protocol LayoutParentPositionVerticalRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraint
    
}

public protocol LayoutParentPositionEdgeRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraint
    
}

public protocol LayoutParentPositionCenterRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraint
    
}

public protocol LayoutParentSizeRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraint
    
}

public protocol LayoutParentSizeListRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraint
    func greaterOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraint
    func lessOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraint
    
}
