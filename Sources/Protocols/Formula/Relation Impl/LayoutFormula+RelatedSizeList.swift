//
//  LayoutFormula+RelatedSizeList.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

public protocol LayoutSizeListRelationImpl: LayoutSizeListRelation { }

extension LayoutSizeListRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Parent Size
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraintMaker {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraintMaker {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorSizeList) -> LayoutConstraintMaker {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Size
    @discardableResult
    public func equal(to other: LayoutTargetSizeList) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetSizeList) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetSizeList) -> LayoutConstraintMaker {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
    /// - Tag: Sibling Size List
    @discardableResult
    public func equal(to contant: LayoutContantValue) -> LayoutConstraintMaker {
        relationToOneself(using: .equal, contant: contant)
    }
    
    @discardableResult
    public func greaterOrEqual(to contant: LayoutContantValue) -> LayoutConstraintMaker {
        relationToOneself(using: .greaterThanOrEqual, contant: contant)
    }
    
    @discardableResult
    public func lessOrEqual(to contant: LayoutContantValue) -> LayoutConstraintMaker {
        relationToOneself(using: .lessThanOrEqual, contant: contant)
    }
    
}
