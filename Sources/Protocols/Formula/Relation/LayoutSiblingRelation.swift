//
//  LayoutSiblingRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import UIKit

public protocol LayoutSiblingOtherRelation { }

extension LayoutSiblingOtherRelation where Self: LayoutTargetProtocol {
    
    internal func isSibling(_ rhs: LayoutSiblingMark) -> Bool {
        LayoutRelationship.isSibling(lhs: target, rhs: rhs)
    }
    
    internal func isSibling(_ rhs: LayoutItem) -> Bool {
        LayoutRelationship.isSibling(lhs: target, rhs: rhs)
    }
    
}

public protocol LayoutSiblingRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutItem) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutItem) -> LayoutConstraint
    func lessOrEqual(to other: LayoutItem) -> LayoutConstraint
    
}

public protocol LayoutSiblingPositionXRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionX) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraint
    
}

public protocol LayoutSiblingPositionYRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionY) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraint
    
}

public protocol LayoutSiblingPositionHorizontalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionHorizontal) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraint
    
}

public protocol LayoutSiblingPositionVerticalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionVertical) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraint
    
}

public protocol LayoutSiblingPositionEdgeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionEdge) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraint
    
}

public protocol LayoutSiblingPositionCenterRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionCenter) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraint
    
}

public protocol LayoutSiblingSizeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetSize) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetSize) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetSize) -> LayoutConstraint
    
}

public protocol LayoutSiblingSizeListRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetSizeList) -> LayoutConstraint
    func greaterOrEqual(to other: LayoutTargetSizeList) -> LayoutConstraint
    func lessOrEqual(to other: LayoutTargetSizeList) -> LayoutConstraint
    
}
