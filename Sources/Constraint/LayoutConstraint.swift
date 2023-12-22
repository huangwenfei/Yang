//
//  LayoutConstraint.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public final class LayoutConstraint: 
    LayoutActivable,
    LayoutConstraintProtocol,
    LayoutConstraintActiveImpl,
    LayoutConstraintUpdateImpl
{
    
    // MARK: Types
    public typealias ActiveReturn = Void
    
    // MARK: Properties
    internal var target: LayoutConstraintAnchorTarget
    internal var related: LayoutConstraintAnchorTarget
    internal var formula: LayoutFormula
    /// NSLayoutConstraint.identifier
    public internal(set) var identifier: String?
    
    public var isActive: Bool = false
    
    public internal(set) var constraints: [LayoutTypes.LayoutConstraintTarget] = []
    
    // MARK: Init
    internal init(
        target: LayoutConstraintAnchorTarget,
        related: LayoutConstraintAnchorTarget,
        formula: LayoutFormula,
        identifier: String? = nil
    ) {
        self.target = target
        self.related = related
        self.formula = formula
        self.identifier = identifier
    }
    
    public init(constraint: LayoutConstraint) {
        self.target = constraint.target
        self.related = constraint.related
        self.formula = constraint.formula
        self.identifier = constraint.identifier
    }
    
    // MARK: CustomReflectable
    public func elements() -> [ReflectableElement] {
        [
            ("target", target),
            ("related", related),
            ("formula", formula),
            ("identifier", String(describing: identifier)),
            ("isActive", isActive)
        ]
    }
    
    // MARK: Copy
    public func copy() -> LayoutConstraint {
        let result = LayoutConstraint(
            target: target.copy(),
            related: related.copy(),
            formula: formula,
            identifier: identifier
        )
        result.isActive = isActive
        result.constraints = constraints
        return result
    }
    
}

extension LayoutConstraint: LayoutConstraintInternalProtocol {
    
    /// LayoutConstraintAnchorTarget -> LayoutConstraintItem List -> NSLayoutConstraint List
    internal func buildConstraints() {
        let items: [LayoutConstraintItem] = zip(
            target.anchor.attributes, related.anchor.attributes
        ).map({
            .init(
                from: .init(attribute: $0, target: target.target),
                to: .init(attribute: $1, target: related.target),
                formula: formula,
                identifier: identifier
            )
        })
        constraints = items.map({ $0.constraint })
    }
    
    internal func removeConstraints() {
        constraints = []
    }
    
    internal func activeConstraints() {
        constraints.forEach({
            guard let first = ($0.firstItem as? LayoutItem) else {
                return
            }
            first.prepareAndSaveState()
            
            if let second = ($0.secondItem as? LayoutItem),
               second !== first.parent 
            {
                second.prepareAndSaveState()
            }
        })
        LayoutTypes.LayoutConstraintTarget.activate(constraints)
        isActive = true
    }
    
    internal func deactiveConstraints() {
        constraints.forEach({
            guard let first = ($0.firstItem as? LayoutItem) else {
                return
            }
            first.resetState()
            
            if let second = ($0.secondItem as? LayoutItem),
               second !== first.parent
            {
                second.resetState()
            }
        })
        LayoutTypes.LayoutConstraintTarget.deactivate(constraints)
        isActive = false
    }
    
    internal func cacheConstraint() {
        target.target?.add(item: self)
    }
    
    internal func cleanConstraint() {
        target.target?.remove(item: self)
    }
    
}
