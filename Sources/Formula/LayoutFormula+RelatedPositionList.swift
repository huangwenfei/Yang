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
    public func equalToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraintMaker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraintMaker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> LayoutConstraintMaker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionCenter) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionCenter) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionHorizontalRelationImpl: LayoutPositionHorizontalRelation { }

extension LayoutPositionHorizontalRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraintMaker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraintMaker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> LayoutConstraintMaker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionHorizontal) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionHorizontal) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionVerticalRelationImpl: LayoutPositionVerticalRelation { }

extension LayoutPositionVerticalRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraintMaker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraintMaker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> LayoutConstraintMaker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionVertical) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionVertical) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionEdgeRelationImpl: LayoutPositionEdgeRelation { }

extension LayoutPositionEdgeRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraintMaker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraintMaker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> LayoutConstraintMaker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: LayoutTargetPositionEdge) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetPositionEdge) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}
