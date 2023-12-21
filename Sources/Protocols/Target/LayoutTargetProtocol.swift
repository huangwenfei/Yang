//
//  LayoutTargetProtocol.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutTargetProtocol: AnyObject {
    associatedtype Maker: LayoutConstraintProtocol
    var maker: Maker { get }
    init(maker: Maker)
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
    
    internal func relationToParent(using relate: LayoutRelation) -> Maker {
        
        LayoutFormulaRelator.relationToParent<Maker>(
            using: relate, from: maker
        )
    }
    
    internal func relationToParent(using relate: LayoutRelation, anchor other: LayoutAnchor) -> Maker {
        
        LayoutFormulaRelator.relationToParent(
            using: relate,
            from: maker,
            anchor: other
        )
    }
    
    internal func relationToSibliingJudge(using relate: LayoutRelation, other: LayoutItem) -> Maker {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: maker,
            other: other
        )
    }
    
    internal func relationToSibliing(using relate: LayoutRelation, other: LayoutItem) -> Maker {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate, from: maker, other: other
        )
    }
    
    internal func relationToSibliingJudge<Target: LayoutTargetProtocol>(using relate: LayoutRelation, other: Target) -> Maker {
        
        LayoutFormulaRelator.relationToSibliingJudge(
            using: relate,
            from: maker,
            other: other
        )
    }
    
    internal func relationToSibliing<Target: LayoutTargetProtocol>(using relate: LayoutRelation, other: Target) -> Maker {
        
        LayoutFormulaRelator.relationToSibliing(
            using: relate,
            from: maker,
            other: other
        )
    }
    
    internal func relationToOneself(using relate: LayoutRelation, contant: LayoutContantValue) -> Maker {
        
        LayoutFormulaRelator.relationToOneself(
            using: relate,
            from: maker,
            constant: contant
        )
    }
    
}
