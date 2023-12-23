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
    public func equalToParent(_ anchor: LayoutAnchorPositionCenter) -> Maker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> Maker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionCenter) -> Maker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: Self) -> Maker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionHorizontalRelationImpl: LayoutPositionHorizontalRelation { }

extension LayoutPositionHorizontalRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionHorizontal) -> Maker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> Maker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionHorizontal) -> Maker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: Self) -> Maker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionVerticalRelationImpl: LayoutPositionVerticalRelation { }

extension LayoutPositionVerticalRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionVertical) -> Maker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> Maker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionVertical) -> Maker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: Self) -> Maker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}


public protocol LayoutPositionEdgeRelationImpl: LayoutPositionEdgeRelation { }

extension LayoutPositionEdgeRelationImpl where Self: LayoutTargetProtocol {

    /// - Tag: Parent Position List
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorPositionEdge) -> Maker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> Maker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorPositionEdge) -> Maker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }

    /// - Tag: Sibling Position List
    @discardableResult
    public func equal(to other: Self) -> Maker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: Self) -> Maker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
}
