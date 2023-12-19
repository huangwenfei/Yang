//
//  LayoutFormula+RelatedPosition.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

public protocol LayoutPositionXRelationImpl: LayoutPositionXRelation { }

extension LayoutPositionXRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraint {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraint {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraint {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position
    @discardableResult
    public func equal(to other: LayoutTargetPositionX) -> LayoutConstraint {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraint {
        relationToSibliing(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraint {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionYRelationImpl: LayoutPositionYRelation { }

extension LayoutPositionYRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraint {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraint {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraint {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position
    @discardableResult
    public func equal(to other: LayoutTargetPositionY) -> LayoutConstraint {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraint {
        relationToSibliing(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraint {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}
