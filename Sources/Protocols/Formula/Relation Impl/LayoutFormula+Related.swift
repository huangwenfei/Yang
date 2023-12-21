//
//  LayoutFormula+Related.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

public protocol LayoutParentRelationImpl: LayoutParentRelation { }

extension LayoutParentRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Parent
    @discardableResult
    public func equalToParent() -> Maker {
        relationToParent(using: .equal)
    }
    
    @discardableResult
    public func greaterOrEqualToParent() -> Maker {
        relationToParent(using: .greaterThanOrEqual)
    }
    
    @discardableResult
    public func lessOrEqualToParent() -> Maker {
        relationToParent(using: .lessThanOrEqual)
    }
    
}


public protocol LayoutSiblingRelationImpl: LayoutSiblingRelation { }

extension LayoutSiblingRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Sibling
    @discardableResult
    public func equal(to other: LayoutItem) -> Maker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutItem) -> Maker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutItem) -> Maker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}
