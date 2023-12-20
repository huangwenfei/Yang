//
//  LayoutTargetProtocol.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutTargetProtocol: AnyObject {
    var maker: LayoutConstraintMaker { get }
    init(maker: LayoutConstraintMaker)
}

extension LayoutTargetProtocol {
    public var anchor: LayoutAnchor { 
        get { maker.constraint.target.anchor }
        set { maker.constraint.target.anchor = newValue }
    }
    
    public var target: LayoutItem? { 
        get { maker.constraint.target.target }
        set { maker.constraint.target.target = newValue }
    }
}


extension LayoutTargetProtocol {
    
    internal func relationToParent(using relate: LayoutRelation) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToParent(
            using: relate, from: maker
        )
    }
    
    internal func relationToParent(using relate: LayoutRelation, anchor other: LayoutAnchor) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToParent(
            using: relate,
            from: maker,
            anchor: other
        )
    }
    
    internal func relationToSibliingJudge(using relate: LayoutRelation, other: LayoutItem) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: maker,
            other: other
        )
    }
    
    internal func relationToSibliing(using relate: LayoutRelation, other: LayoutItem) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate, from: maker, other: other
        )
    }
    
    internal func relationToSibliingJudge<Target: LayoutTarget>(using relate: LayoutRelation, other: Target) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: maker,
            other: other
        )
    }
    
    internal func relationToSibliing<Target: LayoutTarget>(using relate: LayoutRelation, other: Target) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate,
            from: maker,
            other: other
        )
    }
    
    internal func relationToOneself(using relate: LayoutRelation, contant: LayoutContantValue) -> LayoutConstraintMaker {
        
        LayoutFormulaRelator.relationToOneself(
            using: relate,
            from: maker,
            constant: contant
        )
    }
    
}
