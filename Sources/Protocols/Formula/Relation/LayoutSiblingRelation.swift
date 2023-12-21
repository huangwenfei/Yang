//
//  LayoutSiblingRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import UIKit

public protocol LayoutSiblingOtherRelation: LayoutTargetProtocol { }

extension LayoutSiblingOtherRelation {
    
    internal func isSibling(_ rhs: LayoutSiblingMark) -> Bool {
        LayoutRelationship.isSibling(lhs: target, rhs: rhs)
    }
    
    internal func isSibling(_ rhs: LayoutItem) -> Bool {
        LayoutRelationship.isSibling(lhs: target, rhs: rhs)
    }
    
}

public protocol LayoutSiblingRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutItem) -> Maker
    func greaterOrEqual(to other: LayoutItem) -> Maker
    func lessOrEqual(to other: LayoutItem) -> Maker
    
}

public protocol LayoutSiblingPositionXRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionX<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetPositionX<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetPositionX<Maker>) -> Maker
    
}

public protocol LayoutSiblingPositionYRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionY<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetPositionY<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetPositionY<Maker>) -> Maker
    
}

public protocol LayoutSiblingPositionHorizontalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionHorizontal<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetPositionHorizontal<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetPositionHorizontal<Maker>) -> Maker
    
}

public protocol LayoutSiblingPositionVerticalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionVertical<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetPositionVertical<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetPositionVertical<Maker>) -> Maker
    
}

public protocol LayoutSiblingPositionEdgeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionEdge<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetPositionEdge<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetPositionEdge<Maker>) -> Maker
    
}

public protocol LayoutSiblingPositionCenterRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetPositionCenter<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetPositionCenter<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetPositionCenter<Maker>) -> Maker
    
}

public protocol LayoutSiblingSizeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetSize<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetSize<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetSize<Maker>) -> Maker
    
}

public protocol LayoutSiblingSizeListRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: LayoutTargetSizeList<Maker>) -> Maker
    func greaterOrEqual(to other: LayoutTargetSizeList<Maker>) -> Maker
    func lessOrEqual(to other: LayoutTargetSizeList<Maker>) -> Maker
    
}
