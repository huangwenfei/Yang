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
    public func equalToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraintMaker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraintMaker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionX) -> LayoutConstraintMaker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position
    @discardableResult
    public func equal(to other: LayoutTargetPositionX) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraintMaker {
        relationToSibliing(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionX) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionYRelationImpl: LayoutPositionYRelation { }

extension LayoutPositionYRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraintMaker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraintMaker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionY) -> LayoutConstraintMaker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position
    @discardableResult
    public func equal(to other: LayoutTargetPositionY) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraintMaker {
        relationToSibliing(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionY) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}
