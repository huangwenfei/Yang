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
    
    func equalToParent() -> LayoutConstraintMaker
    func greaterOrEqualToParent() -> LayoutConstraintMaker
    func lessOrEqualToParent() -> LayoutConstraintMaker
    
}

public protocol LayoutParentPositionXRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraintMaker
    
}

public protocol LayoutParentPositionYRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraintMaker
    
}

public protocol LayoutParentPositionHorizontalRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraintMaker
    
}

public protocol LayoutParentPositionVerticalRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraintMaker
    
}

public protocol LayoutParentPositionEdgeRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraintMaker
    
}

public protocol LayoutParentPositionCenterRelation: LayoutParentAnchorRelation {

    func equalToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraintMaker
    
}

public protocol LayoutParentSizeRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraintMaker
    
}

public protocol LayoutParentSizeListRelation: LayoutParentAnchorRelation {
    
    func equalToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraintMaker
    func greaterOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraintMaker
    func lessOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraintMaker
    
}
