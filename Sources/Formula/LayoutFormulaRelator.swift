//
//  LayoutFormulaRelator.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

internal struct LayoutFormulaRelator { }

extension LayoutFormulaRelator {
    
    internal static func defaultFormula(using relate: LayoutRelation) -> LayoutFormula {
        .init(
            relation: relate,
            multiplier: 1,
            constant: 0,
            priority: LayoutPriority.normal.systemPriority
        )
    }
    
    internal static func relationToParent<Maker: LayoutConstraintProtocol>(
        using relate: LayoutRelation,
        from constraint: Maker
    ) -> Maker {
        
        guard LayoutRelationship.haveParent(constraint.target) else {
            fatalError(
                String(describing: self) +
                    LayoutError.noParent.localizedDescription
            )
        }
        
        constraint.related.anchor = constraint.anchor
        constraint.related.target = constraint.target?.parent
        
        constraint.formula.relation = relate
        
        return constraint
    }
    
    internal static func relationToParent<Maker: LayoutConstraintProtocol>(
        using relate: LayoutRelation,
        from constraint: Maker,
        anchor other: LayoutAnchor
    ) -> Maker {
        
        /// - Tag: From
        let target = constraint.target
        let anchor = constraint.anchor
        
        /// - Tag: Have Parent
        guard LayoutRelationship.haveParent(target) else {
            fatalError(
                String(describing: self) +
                    LayoutError.noParent.localizedDescription
            )
        }
        
        /// - Tag: Judge
        guard
            /// Empty
            other.isEmpty ||
            /// Single
            (anchor.isPositionX && other.isPositionX) ||
            (anchor.isPositionY && other.isPositionY) ||
            (anchor.isSize && other.isSize) ||
            /// Array
            anchor.attributes == other.attributes ||
            /// size vs size / edge vs eMargins / edge vs edge / center vs cMargins / center vd center ...
            anchor.attributeCompression == other.attributeCompression
        else {
            fatalError(
                String(describing: self) +
                    LayoutError.attributes.localizedDescription +
                    "lhs: " + String(describing: anchor.attributes) +
                    "rhs: " + String(describing: other.attributes)
            )
        }
        
        /// - Tag: Build
        constraint.related.anchor = other
        constraint.related.target = target?.parent
        
        constraint.formula.relation = relate
        
        return constraint
    }
    
    internal static func relationToSibliingJudge<Maker: LayoutConstraintProtocol>(
        using relate: LayoutRelation,
        from constraint: Maker,
        other: LayoutItem
    ) -> Maker {
        
        if LayoutRelationship.isParent(
            oneself: constraint.target, parentIs: other
        ) {
            return relationToParent(using: relate, from: constraint)
        }
        
        return relationToSibliing(
            using: relate, from: constraint, other: other
        )
    }
    
    internal static func relationToSibliing<Maker: LayoutConstraintProtocol>(
        using relate: LayoutRelation,
        from constraint: Maker,
        other: LayoutItem
    ) -> Maker {
        
        guard LayoutRelationship.isSibling(
            lhs: constraint.target, rhs: other
        ) else {
            fatalError(
                String(describing: self) +
                    String(describing: other) +
                    LayoutError.noSibling.localizedDescription
            )
        }
        
        constraint.related.anchor = constraint.anchor
        constraint.related.target = other
        
        constraint.formula.relation = relate
        
        return constraint
    }
    
    internal static func relationToSibliingJudge<Target: LayoutTargetProtocol, Maker: LayoutConstraintProtocol>(
        using relate: LayoutRelation,
        from constraint: Maker,
        other: Target
    ) -> Maker {
        
        if LayoutRelationship.isParent(
            oneself: constraint.target, parentIs: other.target
        ) {
            return relationToParent(
                using: relate, from: constraint, anchor: other.anchor
            )
        }
        
        return relationToSibliing(
            using: relate, from: constraint, other: other
        )
    }
    
    internal static func relationToSibliing<Target: LayoutTargetProtocol, Maker: LayoutConstraintProtocol>(
        using relate: LayoutRelation,
        from constraint: Maker,
        other: Target
    ) -> Maker {
        
        guard LayoutRelationship.isSibling(
            lhs: constraint.target, rhs: other.target
        ) else {
            fatalError(
                String(describing: self) +
                    String(describing: other) +
                    LayoutError.noSibling.localizedDescription
            )
        }
        
        constraint.related.anchor = other.anchor
        constraint.related.target = other.target
        
        constraint.formula.relation = relate
        
        return constraint
    }
    
    internal static func relationToOneself<Maker: LayoutConstraintProtocol>(
        using relate: LayoutRelation,
        from constraint: Maker,
        constant: LayoutContantValue
    ) -> Maker {
        
        constraint.related.anchor = .none
        constraint.related.target = nil
        
        constraint.formula.relation = relate
        constraint.formula.constant = constant
        
        return constraint
    }
    
}
