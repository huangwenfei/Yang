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
    
    func equal(to other: LayoutItem) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutItem) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutItem) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingPositionXRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionX) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingPositionYRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionY) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingPositionHorizontalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionHorizontal) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingPositionVerticalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionVertical) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingPositionEdgeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionEdge) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingPositionCenterRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionCenter) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingSizeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetSize) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetSize) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetSize) -> LayoutConstraintMaker
    
}

public protocol LayoutSiblingSizeListRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetSizeList) -> LayoutConstraintMaker
    func greaterOrEqual(to other: LayoutTargetSizeList) -> LayoutConstraintMaker
    func lessOrEqual(to other: LayoutTargetSizeList) -> LayoutConstraintMaker
    
}
