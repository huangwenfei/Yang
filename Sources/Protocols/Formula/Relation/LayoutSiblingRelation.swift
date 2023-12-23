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
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}

public protocol LayoutSiblingPositionYRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}

public protocol LayoutSiblingPositionHorizontalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}

public protocol LayoutSiblingPositionVerticalRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}

public protocol LayoutSiblingPositionEdgeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}

public protocol LayoutSiblingPositionCenterRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}

public protocol LayoutSiblingSizeRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}

public protocol LayoutSiblingSizeListRelation: LayoutSiblingOtherRelation {
    
    func equal(to other: Self) -> Maker
    func greaterOrEqual(to other: Self) -> Maker
    func lessOrEqual(to other: Self) -> Maker
    
}
