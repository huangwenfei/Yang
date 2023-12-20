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
    var constraint: LayoutConstraintMaker { get }
    
    init(anchor: LayoutAnchor, target: LayoutItem?)
}

extension LayoutTargetProtocol {
    
    internal func relationToParent(using relate: LayoutRelation) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToParent(
            using: relate, from: constraint
        )
    }
    
    internal func relationToParent(using relate: LayoutRelation, anchor other: LayoutAnchor) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToParent(
            using: relate,
            from: constraint,
            anchor: other
        )
    }
    
    internal func relationToSibliingJudge(using relate: LayoutRelation, other: LayoutItem) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: constraint,
            other: other
        )
    }
    
    internal func relationToSibliing(using relate: LayoutRelation, other: LayoutItem) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate, from: constraint, other: other
        )
    }
    
    internal func relationToSibliingJudge<Target: LayoutTarget>(using relate: LayoutRelation, other: Target) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: constraint,
            other: other
        )
    }
    
    internal func relationToSibliing<Target: LayoutTarget>(using relate: LayoutRelation, other: Target) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate,
            from: constraint,
            other: other
        )
    }
    
    internal func relationToOneself(using relate: LayoutRelation, contant: LayoutContantValue) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToOneself(
            using: relate,
            from: constraint,
            constant: contant
        )
    }
    
}
