//
//  LayoutFormula+RelatedPositionList.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import UIKit

public protocol LayoutPositionCenterRelationImpl: LayoutPositionCenterRelation { }

extension LayoutPositionCenterRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraint {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraint {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraint {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionCenter) -> LayoutConstraint {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraint {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraint {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionHorizontalRelationImpl: LayoutPositionHorizontalRelation { }

extension LayoutPositionHorizontalRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraint {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraint {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraint {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionHorizontal) -> LayoutConstraint {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraint {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraint {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionVerticalRelationImpl: LayoutPositionVerticalRelation { }

extension LayoutPositionVerticalRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraint {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraint {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraint {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionVertical) -> LayoutConstraint {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraint {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraint {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionEdgeRelationImpl: LayoutPositionEdgeRelation { }

extension LayoutPositionEdgeRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraint {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraint {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraint {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionEdge) -> LayoutConstraint {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraint {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraint {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}
