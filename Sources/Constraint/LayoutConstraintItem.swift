//
//  LayoutConstraintItem.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

internal final class LayoutConstraintItem: CustomReflectable {
    
    // MARK: Properties
    internal let uuid: UUID
    internal var from: LayoutConstraintTarget
    internal var to: LayoutConstraintTarget
    internal var formula: LayoutFormula
    /// NSLayoutConstraint.identifier
    internal var identifier: String?
    
    internal var constraint: LayoutTypes.LayoutConstraintTarget {
        let result = LayoutTypes.LayoutConstraintTarget(
            item: from.target!,
            attribute: from.attribute,
            relatedBy: formula.relation.nsRelation,
            toItem: to.target,
            attribute: to.attribute,
            multiplier: formula.multiplier.yangMultiplierValue,
            constant: formula.constant.yangContantValue(by: to.attribute)
        )
        result.priority = formula.priority.yangPriorityUIValue
        result.identifier = identifier
        return result
    }
    
    // MARK: Init
    internal init(from: LayoutConstraintTarget, to: LayoutConstraintTarget, formula: LayoutFormula, identifier: String?) {
        self.uuid = .init()
        self.from = from
        self.to = to
        self.formula = formula
        self.identifier = identifier
    }
    
    // MARK: CustomReflectable
    internal typealias ReflectableElement = (label: String?, value: Any)
    internal func elements() -> [ReflectableElement] {
        [
            ("from", from),
            ("to", to),
            ("formula", formula),
            ("identifier", String(describing: identifier))
        ]
    }
    
    internal var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}
