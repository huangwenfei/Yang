//
//  LayoutTargetProtocol.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutTargetProtocol {
    var anchor: LayoutAnchor { get }
    var target: LayoutItem? { get }
    var constraint: LayoutConstraint { get }
    
    init(anchor: LayoutAnchor, target: LayoutItem?)
}

extension LayoutTargetProtocol {
    
    internal func relationToParent(using relate: LayoutRelation) -> LayoutConstraint {
        
        LayoutFormulaRelator.relationToParent(
            using: relate, from: constraint
        )
    }
    
    internal func relationToParent(using relate: LayoutRelation, anchor other: LayoutAnchor) -> LayoutConstraint {
        
        LayoutFormulaRelator.relationToParent(
            using: relate,
            from: constraint,
            anchor: other
        )
    }
    
    internal func relationToSibliingJudge(using relate: LayoutRelation, other: LayoutItem) -> LayoutConstraint {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: constraint,
            other: other
        )
    }
    
    internal func relationToSibliing(using relate: LayoutRelation, other: LayoutItem) -> LayoutConstraint {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate, from: constraint, other: other
        )
    }
    
    internal func relationToSibliingJudge<Target: LayoutTarget>(using relate: LayoutRelation, other: Target) -> LayoutConstraint {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: constraint,
            other: other
        )
    }
    
    internal func relationToSibliing<Target: LayoutTarget>(using relate: LayoutRelation, other: Target) -> LayoutConstraint {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate,
            from: constraint,
            other: other
        )
    }
    
    internal func relationToOneself(using relate: LayoutRelation, contant: LayoutContantValue) -> LayoutConstraint {
        
        LayoutFormulaRelator.relationToOneself(
            using: relate,
            from: constraint,
            constant: contant
        )
    }
    
}
