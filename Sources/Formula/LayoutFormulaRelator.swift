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
    
    internal static func relationToParent(
        using relate: LayoutRelation,
        from constraint: LayoutConstraint
    ) -> LayoutConstraint {
        
        guard LayoutRelationship.haveParent(constraint.target.target) else {
            fatalError(
                String(describing: self) +
                    LayoutError.noParent.localizedDescription
            )
        }
        
        constraint.related.anchor = constraint.target.anchor
        constraint.related.target = constraint.target.target?.parent
        
        constraint.formula.relation = relate
        
        return constraint
    }
    
    internal static func relationToParent(
        using relate: LayoutRelation,
        from constraint: LayoutConstraint,
        anchor other: LayoutAnchor
    ) -> LayoutConstraint {
        
        /// - Tag: From
        let target = constraint.target
        let anchor = target.anchor
        
        /// - Tag: Have Parent
        guard LayoutRelationship.haveParent(target.target) else {
            fatalError(
                String(describing: self) +
                    LayoutError.noParent.localizedDescription
            )
        }
        
        /// - Tag: Judge
        guard
            /// Empty
            other.isNone ||
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
        constraint.related.target = target.target?.parent
        
        constraint.formula.relation = relate
        
        return constraint
    }
    
    internal static func relationToSibliingJudge(
        using relate: LayoutRelation,
        from constraint: LayoutConstraint,
        other: LayoutItem
    ) -> LayoutConstraint {
        
        guard LayoutRelationship.isParent(
            oneself: constraint.target.target, parentIs: other
        ) else {
            return relationToParent(using: relate, from: constraint)
        }
        
        return relationToSibliing(
            using: relate, from: constraint, other: other
        )
    }
    
    internal static func relationToSibliing(
        using relate: LayoutRelation,
        from constraint: LayoutConstraint,
        other: LayoutItem
    ) -> LayoutConstraint {
        
        guard LayoutRelationship.isSibling(
            lhs: constraint.target.target, rhs: other
        ) else {
            fatalError(
                String(describing: self) +
                    String(describing: other) +
                    LayoutError.noSibling.localizedDescription
            )
        }
        
        constraint.related.anchor = constraint.target.anchor
        constraint.related.target = other
        
        constraint.formula.relation = relate
        
        return constraint
    }
    
    internal static func relationToSibliingJudge<Target: LayoutTargetProtocol>(
        using relate: LayoutRelation,
        from constraint: LayoutConstraint,
        other: Target
    ) -> LayoutConstraint {
        
        guard LayoutRelationship.isParent(
            oneself: constraint.target.target, parentIs: other.target
        ) else {
            return relationToParent(using: relate, from: constraint)
        }
        return relationToSibliing(
            using: relate, from: constraint, other: other
        )
    }
    
    internal static func relationToSibliing<Target: LayoutTargetProtocol>(
        using relate: LayoutRelation,
        from constraint: LayoutConstraint,
        other: Target
    ) -> LayoutConstraint {
        
        guard LayoutRelationship.isSibling(
            lhs: constraint.target.target, rhs: other.target
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
    
    internal static func relationToOneself(
        using relate: LayoutRelation,
        from constraint: LayoutConstraint,
        constant: LayoutContantValue
    ) -> LayoutConstraint {
        
        constraint.related.anchor = .none
        constraint.related.target = nil
        
        constraint.formula.relation = relate
        constraint.formula.constant = constant
        
        return constraint
    }
    
}
