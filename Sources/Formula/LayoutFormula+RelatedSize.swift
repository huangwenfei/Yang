//
//  LayoutFormula+RelatedSize.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

public protocol LayoutSizeRelationImpl: LayoutSizeRelation { }

extension LayoutSizeRelationImpl where Self: LayoutTargetProtocol {
    
    /// - Tag: Parent Size
    @discardableResult
    public func equalToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraint {
        relationToParent(using: .equal, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func greaterOrEqualToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraint {
        relationToParent(using: .greaterThanOrEqual, anchor: anchor.anchor)
    }
    
    @discardableResult
    public func lessOrEqualToParent(_ anchor: LayoutAnchorSize) -> LayoutConstraint {
        relationToParent(using: .lessThanOrEqual, anchor: anchor.anchor)
    }
    
    /// - Tag: Sibling Size
    @discardableResult
    public func equal(to other: LayoutTargetSize) -> LayoutConstraint {
        relationToSibliingJudge(using: .equal, other: other)
    }
    
    @discardableResult
    public func greaterOrEqual(to other: LayoutTargetSize) -> LayoutConstraint {
        relationToSibliingJudge(using: .greaterThanOrEqual, other: other)
    }
    
    @discardableResult
    public func lessOrEqual(to other: LayoutTargetSize) -> LayoutConstraint {
        relationToSibliingJudge(using: .lessThanOrEqual, other: other)
    }
    
    /// - Tag: Sibling Size Contant
    @discardableResult
    public func equal(to contant: LayoutContantValue) -> LayoutConstraint {
        relationToOneself(using: .equal, contant: contant)
    }
    
    @discardableResult
    public func greaterOrEqual(to contant: LayoutContantValue) -> LayoutConstraint {
        relationToOneself(using: .greaterThanOrEqual, contant: contant)
    }
    
    @discardableResult
    public func lessOrEqual(to contant: LayoutContantValue) -> LayoutConstraint {
        relationToOneself(using: .lessThanOrEqual, contant: contant)
    }
    
}
